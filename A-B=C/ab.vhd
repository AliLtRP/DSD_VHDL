Library ieee;
use ieee.std_logic_1164.all;

entity ab is 
	port(a,b: in std_logic_vector (3 downto 0); cin: in std_logic; c : out std_logic_vector (3 downto 0); cout : out std_logic);
end ab;

architecture data of ab is 

component four is
	port(a0,a1,a2,a3,b0,b1,b2,b3 : in std_logic;cin: in std_logic; s0,s1,s2,s3: out std_logic; c: out std_logic);
end component;

component two is
	port(a0,a1,a2,a3,b0,b1,b2,b3: in std_logic; c0,c1,c2,c3: out std_logic);
end component;

signal y: std_logic_vector (7 downto 0);

begin 
	x0: two port map ( b(0),b(1),b(2),b(3),'0','0','0','0', y(0),y(1),y(2),y(3) );
	x1: four port map (a(0),a(1),a(2),a(3),y(0),y(1),y(2),y(3),'0', c(0),c(1),c(2),c(3));
end data;