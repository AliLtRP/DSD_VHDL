library verilog;
use verilog.vl_types.all;
entity one is
    port(
        a3              : in     vl_logic;
        a2              : in     vl_logic;
        a1              : in     vl_logic;
        a0              : in     vl_logic;
        b3              : out    vl_logic;
        b2              : out    vl_logic;
        b1              : out    vl_logic;
        b0              : out    vl_logic
    );
end one;
