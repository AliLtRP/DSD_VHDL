library verilog;
use verilog.vl_types.all;
entity decoder_4 is
    port(
        a0              : in     vl_logic;
        a1              : in     vl_logic;
        e               : in     vl_logic;
        y               : out    vl_logic;
        y1              : out    vl_logic;
        y2              : out    vl_logic;
        y3              : out    vl_logic
    );
end decoder_4;
