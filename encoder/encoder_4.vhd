Library ieee;
use ieee.std_logic_1164.all;

entity encoder_4 is
	port(y: in std_logic_vector (3 downto 0) ; a: out std_logic_vector (1 downto 0));
end encoder_4;

architecture data of encoder_4 is

begin
	a(0) <= y(3) or y(1);
	a(1) <= y(3) or y(2);
end data;