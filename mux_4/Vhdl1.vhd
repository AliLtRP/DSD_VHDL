Library ieee;
use ieee.std_logic_1164.all;

entity mux_4 is
	port(i0,i1,i2,i3: in std_logic; s0,s1: in std_logic; z:out std_logic);
end mux_4;

architecture data of mux_4 is

component not_gate is
	port(x: in std_logic; z: out std_logic);
end component;

component and_3 is
	port(x0,x1,x2: in std_logic; z: out std_logic);
end component;

component or_4 is
	port(x0,x1,x2,x3: in std_logic; z: out std_logic);
end component;

signal y: std_logic_vector (5 downto 0);

begin
	k0: not_gate port map (s0, y(0));
	k1: not_gate port map (s1, y(1));
	k2: and_3 port map (i0, y(1), y(0), y(2));
	k3: and_3 port map (i1, y(1), s0, y(3));
	k4: and_3 port map (i2, s1, y(0), y(4));
	k5: and_3 port map (i3, s1, s0, y(5));
	k6: or_4 port map (y(2), y(3), y(4), y(5), z);
end data;