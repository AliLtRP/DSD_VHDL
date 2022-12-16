library verilog;
use verilog.vl_types.all;
entity or_4 is
    port(
        x               : in     vl_logic_vector(3 downto 0);
        z               : out    vl_logic
    );
end or_4;
