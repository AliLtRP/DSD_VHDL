library verilog;
use verilog.vl_types.all;
entity not_gate is
    port(
        x               : in     vl_logic;
        z               : out    vl_logic
    );
end not_gate;
