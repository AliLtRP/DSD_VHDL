library verilog;
use verilog.vl_types.all;
entity mux_4 is
    port(
        i               : in     vl_logic_vector(3 downto 0);
        s               : in     vl_logic_vector(1 downto 0);
        z               : out    vl_logic
    );
end mux_4;
