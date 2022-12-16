Library ieee;
use ieee.std_logic_1164.all;

entity full is 
	port(a,b,c0 : in std_logic; s,c : out std_logic);
end full;

architecture data of full is

component half is
	port(a,b: in std_logic; s,c: out std_logic);
end component;

component or_2 is 
	port(a,b: in std_logic; c : out std_logic);
end component;

signal y0,y1,y2: std_logic;

begin 
	x0: half port map (a,b, y0, y1);
	x1: half port map (y0, c0, s, y2);
	x2: or_2 port map (y2, y1, c);
end data;