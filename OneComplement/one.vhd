Library ieee;
use ieee.std_logic_1164.all;

entity one is
	port(a3,a2,a1,a0: in std_logic; b3,b2,b1,b0: out std_logic);
end one;

architecture data of one is 

begin 
	b3 <= not a3;
	b2 <= not a2;
	b1 <= not a1;
	b0 <= not a0;
end data;