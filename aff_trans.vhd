library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- interface
entity aff_trans is
port (
	-- data inputs
	
	a 			: in std_logic_vector(7 downto 0);

	-- data outputs
	
	q 			: out std_logic_vector(7 downto 0)

);
end aff_trans;

architecture struct of aff_trans is


	signal aA, aB, aC , aD	: std_logic;
	

begin

	aA <= a(0) xor a(1);
	aB <= a(2) xor a(3);
	aC <= a(4) xor a(5);
	aD <= a(6) xor a(7);
    
	q <= 	(a(3) xor aC xor aD) & 
			((not a(6)) xor aB xor aC) & 
			((not a(1)) xor aB xor aC) & 
			(a(4) xor aA xor aB) & 
			(a(7) xor aA xor aB) & 
			(a(2) xor aA xor aD) & 
			((not a(5)) xor aA xor aD) & 
			((not a(0)) xor aC xor aD);

end struct;
