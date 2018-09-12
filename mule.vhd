library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- interface
entity mule is
port (
	-- data inputs
	
	a 			: in std_logic_vector(3 downto 0);

	-- data outputs
	
	q 			: out std_logic_vector(3 downto 0)

	-- control signals
	
	-- status signals
);
end mule;

architecture struct of mule is
	
	signal aA, aB 	: std_logic;

begin

	aA <= a(0) xor a(1);
   aB <= a(2) xor a(3);
	
	q <= (aA xor aB) & (aA xor a(2)) & aA & ( a(1) xor aB);

	
end struct;
