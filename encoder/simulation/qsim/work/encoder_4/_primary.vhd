library verilog;
use verilog.vl_types.all;
entity encoder_4 is
    port(
        y               : in     vl_logic_vector(3 downto 0);
        a               : out    vl_logic_vector(1 downto 0)
    );
end encoder_4;
