Library ieee;
use ieee.std_logic_1164.all;

entity two is
	port(a0,a1,a2,a3,b0,b1,b2,b3: in std_logic; c0,c1,c2,c3: out std_logic);
end two;

architecture data of two is 

component four is
	port(a0,a1,a2,a3,b0,b1,b2,b3 : in std_logic;cin: in std_logic; s0,s1,s2,s3: out std_logic; c: out std_logic);
end component;

component one is 
	port(a3,a2,a1,a0: in std_logic; b3,b2,b1,b0: out std_logic);
end component;

signal y: std_logic_vector (3 downto 0);

begin 
	x0: one port map (a0,a1,a2,a3, y(0),y(1),y(2),y(3));
	x1: four port map (y(0),y(1),y(2),y(3),'1','0','0','0','0',c0,c1,c2,c3);
end data;