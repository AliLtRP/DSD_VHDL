Library ieee;
use ieee.std_logic_1164.all;

entity four is
	port(a0,a1,a2,a3,b0,b1,b2,b3 : in std_logic;cin: in std_logic; s0,s1,s2,s3: out std_logic; c: out std_logic);
end four;

architecture data of four is 

component full is 
	port(a,b,c0 : in std_logic; s,c : out std_logic);
end component;

signal y: std_logic_vector (3 downto 0);

begin 
	x0: full port map (a0,b0,'0', s0, y(0));
	x1: full port map (a1,b1,y(0), s1, y(1));
	x2: full port map (a2,b2,y(1), s2, y(2));
	x3: full port map (a3,b3,y(2), s3, c);
end data;