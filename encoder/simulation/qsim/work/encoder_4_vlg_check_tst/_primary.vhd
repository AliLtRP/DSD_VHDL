library verilog;
use verilog.vl_types.all;
entity encoder_4_vlg_check_tst is
    port(
        a               : in     vl_logic_vector(1 downto 0);
        sampler_rx      : in     vl_logic
    );
end encoder_4_vlg_check_tst;
