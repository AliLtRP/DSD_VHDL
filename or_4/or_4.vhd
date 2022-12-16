Library ieee;
use ieee.std_logic_1164.all;

entity or_4 is
	port(x0,x1,x2,x3: in std_logic; z: out std_logic);
end or_4;

architecture data of or_4 is 

begin 
	z <= x0 or x1 or x2 or x3;
end data;