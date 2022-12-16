//-------------------------------------------------------------------
//  Altera PCI testbench
//  MODULE NAME: altera_tb

//  FUNCTIONAL DESCRIPTION:
//  This is the top level file of Altera PCI testbench

//---------------------------------------------------------------------------------------


`timescale 1 ns / 1 ns

module altera_tb ();

   wire clk; 
   wire rstn; 
   wire[63:0] ad; 
   wire[7:0] cben; 
   wire req64n; 
   wire framen; 
   wire irdyn; 
   wire ack64n; 
   wire devseln; 
   wire trdyn; 
   wire stopn; 
   wire[63:0] l_adi; 
   wire[63:0] l_dato; 
   wire[63:0] l_adro; 
   wire[7:0] l_beno; 
   wire[3:0] l_cmdo; 
   wire l_ldat_ackn; 
   wire l_hdat_ackn; 
   wire[9:0] lm_tsr; 
   wire lt_abortn; 
   wire lt_discn; 
   wire lt_rdyn; 
   wire lt_framen; 
   wire lt_ackn; 
   wire lt_dxfrn; 
   wire[11:0] lt_tsr; 
   wire l_irqn; 
   
   wire[6:0] cmd_reg; 
   wire[6:0] stat_reg; 
   
   wire perrn; 
   wire serrn; 
   wire intan; 
   wire par; 
   wire par64; 
   wire busfree; 
   wire disengage_mstr; 
   wire tranx_success; 
   wire trgt_tranx_disca; 
   wire trgt_tranx_discb; 
   wire trgt_tranx_retry; 
   
   wire mstr_tranx_reqn; 
   wire mstr_tranx_gntn; 
   wire gntn;
   
   wire [1:0] gntns;
   wire [1:0] reqns;

assign  {mstr_tranx_gntn,gntn} = gntns;
assign reqns = {mstr_tranx_reqn, 1'b1};
  
   clk_gen u0 (.pciclk(clk)); 
   defparam u0.pciclk_66Mhz_enable = 1'b1; 
  
   pci_top u1 (.clk(clk),
               .rstn(rstn), 
               .idsel(ad[28]), 
               .ad(ad), 
               .cben(cben), 
               .par(par), 
               .par64(par64), 
               .req64n(req64n), 
               .framen(framen), 
               .irdyn(irdyn), 
               .ack64n(ack64n), 
               .devseln(devseln), 
               .trdyn(trdyn), 
               .stopn(stopn), 
               .perrn(perrn), 
               .serrn(serrn), 
               .intan(intan), 
               .l_adi(l_adi), 
               .l_dato(l_dato), 
               .l_adro(l_adro), 
               .l_beno(l_beno), 
               .l_cmdo(l_cmdo), 
               .l_ldat_ackn(l_ldat_ackn), 
               .l_hdat_ackn(l_hdat_ackn), 
               .lt_abortn(lt_abortn), 
               .lt_discn(lt_discn), 
               .lt_rdyn(lt_rdyn), 
               .lt_framen(lt_framen), 
               .lt_ackn(lt_ackn), 
               .lt_dxfrn(lt_dxfrn), 
               .lt_tsr(lt_tsr), 
               .lirqn(l_irqn), 
               
               .cmd_reg(cmd_reg), 
               .stat_reg(stat_reg)); 
  
   top_local u2 (
                 //**************************************************
                 //Replace this section with your application design
                 //**************************************************
                 //.Clk(clk), 
                 //.Rstn(rstn), 
                 //.Pcil_adi_o(l_adi), 
                 //.Pcil_dat_i(l_dato), 
                 //.Pcil_adr_i(l_adro), 
                 //.Pcil_ben_i(l_beno), 
                 //.Pcil_cmd_i(l_cmdo), 
                 //.Pcildat_ack_n_i(l_ldat_ackn), 
                 //.Pcihdat_ack_n_i(l_hdat_ackn), 
                 //.Pcilt_abort_n_o(lt_abortn), 
                 //.Pcilt_disc_n_o(lt_discn), 
                 //.Pcilt_rdy_n_o(lt_rdyn), 
                 //.Pcilt_frame_n_i(lt_framen), 
                 //.Pcilt_ack_n_i(lt_ackn), 
                 //.Pcilt_dxfr_n_i(lt_dxfrn), 
                 //.Pcilt_tsr_i(lt_tsr), 
                 //.Pcilirq_n_o(l_irqn)
                 ); 
   
   arbiter u3 (.clk(clk), 
               .rstn(rstn), 
               .busfree(busfree), 
               .pci_reqn(reqns), 
               .pci_gntn(gntns)); 
  
  defparam u3.park = 1'b0;
   
   mstr_tranx u4 (.clk(clk), 
                  .rstn(rstn), 
                  .ad(ad), 
                  .cben(cben), 
                  .par(par), 
                  .par64(par64), 
                  .reqn(mstr_tranx_reqn), 
                  .gntn(mstr_tranx_gntn), 
                  .req64n(req64n), 
                  .framen(framen), 
                  .irdyn(irdyn), 
                  .ack64n(ack64n), 
                  .devseln(devseln), 
                  .trdyn(trdyn), 
                  .stopn(stopn), 
                  .perrn(perrn), 
                  .serrn(serrn), 
                  .busfree(busfree), 
                  .disengage_mstr(disengage_mstr), 
                  .tranx_success(tranx_success), 
                  .trgt_tranx_disca(trgt_tranx_disca), 
                  .trgt_tranx_discb(trgt_tranx_discb), 
                  .trgt_tranx_retry(trgt_tranx_retry)); 
   
   trgt_tranx u5 (.clk(clk), 
                  .rstn(rstn), 
                  .ad(ad), 
                  .cben(cben), 
                  .idsel(ad[29]), 
                  .par(par), 
                  .par64(par64), 
                  .req64n(req64n), 
                  .framen(framen), 
                  .irdyn(irdyn), 
                  .ack64n(ack64n), 
                  .devseln(devseln), 
                  .stopn(stopn), 
                  .trdyn(trdyn), 
                  .perrn(perrn), 
                  .serrn(serrn), 
                  .trgt_tranx_disca(trgt_tranx_disca), 
                  .trgt_tranx_discb(trgt_tranx_discb), 
                  .trgt_tranx_retry(trgt_tranx_retry)); 
  
   monitor u6 (.clk(clk), 
               .rstn(rstn), 
               .ad(ad), 
               .cben(cben), 
               .req64n(req64n), 
               .framen(framen), 
               .irdyn(irdyn), 
               .ack64n(ack64n), 
               .devseln(devseln), 
               .trdyn(trdyn), 
               .stopn(stopn), 
               .busfree(busfree), 
               .disengage_mstr(disengage_mstr), 
               .tranx_success(tranx_success)); 
  
   pull_up u7 (.ad(ad), 
               .cben(cben), 
               .par(par), 
               .par64(par64), 
               .framen(framen), 
               .irdyn(irdyn), 
               .ack64n(ack64n), 
               .devseln(devseln), 
               .trdyn(trdyn), 
               .stopn(stopn), 
               .req64n(req64n), 
               .perrn(perrn), 
               .serrn(serrn), 
               .intan(intan)); 
endmodule
