Library ieee;
use ieee.std_logic_1164.all;

entity half is
	port(a,b: in std_logic; s,c: out std_logic);
end half;

architecture data of half is

begin
	s <= a xor b;
	c <= a and b;
end data;