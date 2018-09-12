library ieee;
use ieee.std_logic_1164.all;

entity reg is
generic( N : integer);
port (
	CLK, rst_n : in std_logic;
	load : in std_logic;
	D : in std_logic_vector(N-1 downto 0);
	Q : out std_logic_vector(N-1 downto 0)
);
end reg;

architecture arc of reg is
begin

	Q <= (others=>'0') 	when rst_n='0' else D when rising_edge(CLK) and load='1';
end arc;

