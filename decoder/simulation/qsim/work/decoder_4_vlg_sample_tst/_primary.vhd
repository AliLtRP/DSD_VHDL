library verilog;
use verilog.vl_types.all;
entity decoder_4_vlg_sample_tst is
    port(
        a0              : in     vl_logic;
        a1              : in     vl_logic;
        e               : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end decoder_4_vlg_sample_tst;
