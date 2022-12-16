library verilog;
use verilog.vl_types.all;
entity ab_vlg_check_tst is
    port(
        c               : in     vl_logic_vector(3 downto 0);
        cout            : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end ab_vlg_check_tst;
