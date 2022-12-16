Library ieee;
use ieee.std_logic_1164.all;

entity decoder_4 is
	port(a0,a1,e: in std_logic; y,y1,y2,y3: out std_logic);
end decoder_4;

architecture data of decoder_4 is 

begin
	y <= '1' and (not a0 and not a1);
	y1 <= '1' and (not a0 and a1);
	y2 <= '1' and (a0 and not a1);
	y3 <= '1' and (a0 and a1);
end data;