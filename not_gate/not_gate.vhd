Library ieee;
use ieee.std_logic_1164.all;

entity not_gate is
	port(x: in std_logic; z: out std_logic);
end not_gate;

architecture data of not_gate is

begin
	z <= not x;
end data;