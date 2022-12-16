Library ieee;
use ieee.std_logic_1164.all;

entity and_2 is 
	port(a,b: in std_logic; z: out std_logic);
end and_2;

architecture data of and_2 is 
begin 
	z <= a and b;
end data;