// (C) 2001-2013 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// This module is a dummy packet generator it sends a packet of programmable length with no timestamp at a rate set by the IPG.
// Hence the TRACE EVENT packet format is NO_TS.
// the module responds to backpressure and so will not drop packets
// the payload of the packet is an incrementing Byte count.  the purpose of this is to enable data integrity checking!

// there are additional nodes in which the length and IPG are PRBS and generated by LFSR
// the LFSR polynomials are defined furhter down in the file.
// NOTE: there is a minimal size of the ouptut packet whcih is one word.

`timescale 1ps / 1ps
`default_nettype none

module altera_trace_dummy_monitor #(
    parameter TRACE_DATA_WIDTH   = 32,
    parameter TRACE_SYMBOL_WIDTH = 8,      // should probably be fixed!
    parameter WAKE_UP_RUNNING    = 0,

    parameter MFGR_ID            = 110,
    parameter TYPE_NUM           = 298,

    // derived parameters
    parameter TRACE_SYM_PER_WORD = TRACE_DATA_WIDTH/TRACE_SYMBOL_WIDTH,
    parameter TRACE_EMPTY_WIDTH  = (TRACE_SYM_PER_WORD>1)? $clog2(TRACE_DATA_WIDTH/TRACE_SYMBOL_WIDTH) : 1
) (
    input  wire clk,
    input  wire arst_n,

// av_st_trace output
    input  wire                         av_st_tr_ready,
    output reg                          av_st_tr_valid,
    output reg                          av_st_tr_sop,
    output reg                          av_st_tr_eop,
    output reg   [TRACE_DATA_WIDTH-1:0] av_st_tr_data,
    output reg  [TRACE_EMPTY_WIDTH-1:0] av_st_tr_empty,


    input  wire                         csr_s_write,
    input  wire                         csr_s_read,
    input  wire                   [3:0] csr_s_address,
    input  wire                  [31:0] csr_s_write_data,
    output reg                   [31:0] csr_s_readdata
);


//CSR IO
(* dont_merge *) reg        csr_wr_op;
(* dont_merge *) reg        csr_rd_op;
(* dont_merge *) reg  [3:0] csr_addr;
(* dont_merge *) reg [31:0] csr_wdata;


// CSR settable bits
reg [31:0] scratchpad_mem;
reg  [7:0] packet_len;
reg  [7:0] packet_gap;
reg        output_enable;
reg        size_is_lfsr;
reg        ipg_is_lfsr;

// stuff for LFSR IPg and size
reg  [7:0] int_packet_len;
reg  [7:0] lfsr_size;
reg  [8:0] lfsr_ipg;
reg  [7:0] int_packet_gap;


always @(posedge clk or negedge arst_n) begin
    if (1'b0 == arst_n) begin
        csr_wr_op      <= 1'b0;
        csr_rd_op      <= 1'b0;
        csr_addr       <= 0;
        csr_wdata      <= 0;
        csr_s_readdata <= {32{1'b0}};

        scratchpad_mem <= {32{1'b0}};
        output_enable  <= WAKE_UP_RUNNING[0];
        packet_len     <= {8{1'b0}};
        packet_gap     <= {8{1'b0}};
        size_is_lfsr   <= 1'b0;
        ipg_is_lfsr    <= 1'b0;
    end else begin

        if (1'b1 == csr_wr_op) begin
            case (csr_addr)
                'd4: begin output_enable  <= csr_wdata[0];
                           size_is_lfsr   <= csr_wdata[8];
                           ipg_is_lfsr    <= csr_wdata[9];
                     end
                'd5: begin scratchpad_mem <= csr_wdata; end
                'd6: begin packet_len     <= csr_wdata[0+:8];
                           packet_gap     <= csr_wdata[16+:8];
                     end
                default: begin
                         end
            endcase
        end

        if (1'b1 == csr_rd_op) begin
            csr_s_readdata <= {32{1'b0}};
            case (csr_addr)
                'd0: begin
                        csr_s_readdata[31:28]  <= 4'h0;
                        csr_s_readdata[27:12]  <= TYPE_NUM[15:0];
                        csr_s_readdata[11]     <= 1'b0;
                        csr_s_readdata[10: 0]  <= MFGR_ID[ 10:0];
                     end
             //   'd1: begin
             //           csr_s_readdata[ 0+:8]  <= FULL_TS_LENGTH[0+:8];
             //           // room for short TS is supported.
             //        end
                'd4: begin  //CONTROL
                        csr_s_readdata[0] <= output_enable;
                        csr_s_readdata[8] <= size_is_lfsr;
                        csr_s_readdata[9] <= ipg_is_lfsr;
                     end
                'd5: begin  // Scratchpad
                        csr_s_readdata <= scratchpad_mem;
                     end
                'd6: begin  // packet_len
                        csr_s_readdata[7:0]   <= packet_len;
                        csr_s_readdata[23:16] <= packet_gap;
                     end
                 default: begin
                          end
            endcase
        end

        csr_wr_op <= csr_s_write;
        csr_rd_op <= csr_s_read;
        csr_addr  <= csr_s_address;
        csr_wdata <= csr_s_write_data;
    end
end


always @(*) begin
    if (size_is_lfsr == 1'b1) begin
        if (lfsr_size[7:0] >= TRACE_SYM_PER_WORD[7:0] ) begin
            int_packet_len = lfsr_size;
        end else begin
            int_packet_len = TRACE_SYM_PER_WORD[7 : 0];
        end
    end else begin
        int_packet_len = packet_len;
    end
end


always @(*) begin
    if (ipg_is_lfsr == 1'b1) begin
        int_packet_gap = lfsr_ipg[7:0];
    end else begin
        int_packet_gap = packet_gap;
    end
end



reg [7:0] count;

integer i;
localparam AV_ST_RST_VAL = 64'h0001020304050607;  // big endian AV_ST data!


wire [TRACE_EMPTY_WIDTH : 0] trace_sym_per_word_minus_count;
wire [TRACE_EMPTY_WIDTH : 0] trace_sym_per_word_minus_pktlen;

assign trace_sym_per_word_minus_count  =  TRACE_SYM_PER_WORD[TRACE_EMPTY_WIDTH : 0] - count[         TRACE_EMPTY_WIDTH : 0];
assign trace_sym_per_word_minus_pktlen =  TRACE_SYM_PER_WORD[TRACE_EMPTY_WIDTH : 0] - int_packet_len[TRACE_EMPTY_WIDTH : 0];

reg count_is_zero;

always @(posedge clk or negedge arst_n) begin
    if (1'b0 == arst_n) begin
        av_st_tr_valid <= 'd0;
        av_st_tr_sop   <= 'd0;
        av_st_tr_eop   <= 'd0;
        av_st_tr_data  <= AV_ST_RST_VAL[63-:TRACE_DATA_WIDTH];
        av_st_tr_empty <= 'd0;
        count          <= 8'd0;
        count_is_zero  <= 1'b1;
    end else begin



        if ((av_st_tr_valid == 1'b1) && (av_st_tr_ready == 1'b1)) begin
            av_st_tr_empty <= 'd0;
            for (i = 0; i < TRACE_SYM_PER_WORD; i = i + 1) begin
                if (av_st_tr_eop   == 1'b1) begin
                    av_st_tr_data[8*i +:8] <= av_st_tr_data[8*i +:8] + ((TRACE_SYM_PER_WORD[TRACE_EMPTY_WIDTH : 0] - 1'b1) - av_st_tr_empty );
                end else begin
                    av_st_tr_data[(8*(TRACE_SYM_PER_WORD-i))-8 +:8] <= av_st_tr_data[0+:8] + (1'b1 +i[TRACE_EMPTY_WIDTH-1 : 0]);
                end
            end
        end

        if (av_st_tr_valid == 1'b0) begin
            if (count_is_zero == 1'b1) begin
                if (output_enable == 1'b1) begin
                    av_st_tr_sop   <= 1'b1;
                    av_st_tr_valid <= 1'b1;
                    av_st_tr_empty <= {TRACE_EMPTY_WIDTH{1'b0}};
                    count          <= int_packet_len - TRACE_SYM_PER_WORD[TRACE_EMPTY_WIDTH : 0];
                    count_is_zero  <= ~|(int_packet_len - TRACE_SYM_PER_WORD[TRACE_EMPTY_WIDTH : 0]);
                    av_st_tr_data[TRACE_DATA_WIDTH-1 -:8] <= 8'h40; // no leading TS packet!
                    if (TRACE_SYM_PER_WORD >= int_packet_len) begin
                        av_st_tr_eop   <= 1'b1;
                        av_st_tr_empty[0+:TRACE_EMPTY_WIDTH] <= trace_sym_per_word_minus_pktlen[0+:TRACE_EMPTY_WIDTH];
                    end
                end
            end else begin
                count <= count - 1'b1;

                if (count < 'd2) begin
                    count_is_zero  <= 1'b1;
                end else begin
                    count_is_zero  <= 1'b0;
                end
            end
        end else begin  // valid is 1
            if (av_st_tr_ready == 1'b1) begin
                av_st_tr_sop   <= 1'b0;
                av_st_tr_data[TRACE_DATA_WIDTH-1 -:8] <= av_st_tr_data[0+:8] + 1'b1;
                if (TRACE_SYM_PER_WORD[7:0] >= count) begin
                    av_st_tr_eop   <= 1'b1;
                    av_st_tr_empty[0+:TRACE_EMPTY_WIDTH] <= trace_sym_per_word_minus_count[0+:TRACE_EMPTY_WIDTH];
                end

                count <= count - TRACE_SYM_PER_WORD[TRACE_EMPTY_WIDTH : 0];
                count_is_zero  <= ~|(count - TRACE_SYM_PER_WORD[TRACE_EMPTY_WIDTH : 0]);
                if (av_st_tr_eop   == 1'b1) begin
                   count          <= int_packet_gap;
                   count_is_zero  <= ~|(int_packet_gap);
                   av_st_tr_valid <= 1'b0;
                   av_st_tr_eop   <= 1'b0;
                end
            end
        end
    end
end



// LFSR based PRBS generator   SIZE has characteristic equation     x^8 + x^6 + x^5 + x^4 + 1
//                             IPG has the characteristic equation  x^9 + x^5 + 1
always @(posedge clk or negedge arst_n) begin
    if (1'b0 == arst_n) begin
        lfsr_size <= 8'd23;
        lfsr_ipg  <= 9'd23;
    end else begin
        if ((av_st_tr_valid == 1'b1) && (av_st_tr_ready == 1'b1) && (av_st_tr_eop == 1'b1)) begin
            lfsr_size <= lfsr_size << 1;
            lfsr_size[0] <= lfsr_size[7] ^ lfsr_size[5] ^ lfsr_size[4] ^ lfsr_size[3];
        end

        if ((av_st_tr_valid == 1'b1) && (av_st_tr_ready == 1'b1) && (av_st_tr_eop == 1'b1)) begin
            lfsr_ipg <= lfsr_ipg << 1;
            lfsr_ipg[0] <= lfsr_ipg[8] ^ lfsr_ipg[4];
        end
    end
end

endmodule
`default_nettype wire
