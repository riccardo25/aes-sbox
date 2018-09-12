library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- interface
entity inv4 is
port (
	-- data inputs
	
	a 			: in std_logic_vector(3 downto 0);

	-- data outputs
	
	q 			: out std_logic_vector(3 downto 0)

	-- control signals
	
	-- status signals
);
end inv4;

architecture struct of inv4 is
	
	signal aA	: std_logic;

begin

	aA <= a(1) xor a(2) xor a(3) xor (a(1) and a(2) and a(3));
	
	q <= (aA xor (a(0) and a(3)) xor (a(1) and a(3)) xor (a(2) and a(3))) 
			& ((a(0) and a(1)) xor a(2) xor (a(0) and a(2))  xor a(3) xor (a(0) and a(3)) xor (a(0) and a(2) and a(3))) 
			& ((a(0) and a(1)) xor (a(0) and a(2)) xor (a(1) and a(2)) xor a(3) xor (a(1) and a(3)) xor (a(0) and a(1) and a(3))) 
			& (aA xor a(0) xor (a(0) and a(2)) xor (a(1) and a(2)) xor (a(0) and a(1) and a(2)));



	
end struct;
