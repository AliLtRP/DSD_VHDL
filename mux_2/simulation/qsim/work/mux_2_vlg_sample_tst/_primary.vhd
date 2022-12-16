library verilog;
use verilog.vl_types.all;
entity mux_2_vlg_sample_tst is
    port(
        i0              : in     vl_logic;
        i1              : in     vl_logic;
        s               : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end mux_2_vlg_sample_tst;
