library verilog;
use verilog.vl_types.all;
entity mux_4_vlg_sample_tst is
    port(
        i               : in     vl_logic_vector(3 downto 0);
        s               : in     vl_logic_vector(1 downto 0);
        sampler_tx      : out    vl_logic
    );
end mux_4_vlg_sample_tst;
