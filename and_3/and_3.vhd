Library ieee;
use ieee.std_logic_1164.all;

entity and_3 is
	port(x0,x1,x2: in std_logic; z: out std_logic);
end and_3;

architecture data of and_3 is 

begin
	z <= x0 and x1 and x2;
end data;	