Library ieee;
use ieee.std_logic_1164.all;

entity mux_2 is
	port(i0, i1: in std_logic ;s: in std_logic; z:out std_logic);
end mux_2;

architecture data of mux_2 is

begin 
	z <= (i0 and (not s)) or (i1 and s);
end data;