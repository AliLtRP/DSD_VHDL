library verilog;
use verilog.vl_types.all;
entity one_vlg_sample_tst is
    port(
        a0              : in     vl_logic;
        a1              : in     vl_logic;
        a2              : in     vl_logic;
        a3              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end one_vlg_sample_tst;
