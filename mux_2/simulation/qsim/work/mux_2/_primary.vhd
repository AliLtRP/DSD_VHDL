library verilog;
use verilog.vl_types.all;
entity mux_2 is
    port(
        i0              : in     vl_logic;
        i1              : in     vl_logic;
        s               : in     vl_logic;
        z               : out    vl_logic
    );
end mux_2;
