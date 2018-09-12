library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- interface
entity mul4 is
port (
	-- data inputs
	
	a 			: in std_logic_vector(3 downto 0);
	b 			: in std_logic_vector(3 downto 0);

	-- data outputs
	
	q 			: out std_logic_vector(3 downto 0)

	-- control signals
	
	-- status signals
);
end mul4;

architecture struct of mul4 is
	
	signal aA, aB 	: std_logic;

begin

	aA <= a(0) xor a(3);
   aB <= a(2) xor a(3);
	
	q <= ((a(3) and b(0)) xor (a(2) and b(1)) xor (a(1) and b(2)) xor (aA and b(3))) & ((a(2) and b(0)) xor (a(1) and b(1)) xor (aA and b(2)) xor (aB and b(3))) & ((a(1) and b(0)) xor (aA and b(1)) xor (aB and b(2)) xor ((a(1) xor a(2)) and b(3))) & ((a(0) and b(0)) xor (a(3) and b(1)) xor (a(2) and b(2)) xor (a(1) and b(3)));

	
end struct;
