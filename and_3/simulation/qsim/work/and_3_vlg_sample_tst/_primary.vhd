library verilog;
use verilog.vl_types.all;
entity and_3_vlg_sample_tst is
    port(
        x               : in     vl_logic_vector(2 downto 0);
        sampler_tx      : out    vl_logic
    );
end and_3_vlg_sample_tst;
