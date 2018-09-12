
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- interface
entity inv_aff_trans is
port (
	-- data inputs
	
	a 			: in std_logic_vector(7 downto 0);

	-- data outputs
	
	q 			: out std_logic_vector(7 downto 0)

);
end inv_aff_trans;

architecture struct of inv_aff_trans is


	signal aA, aB, aC , aD	: std_logic;
	

begin

	aA <= a(0) xor a(5);
	aB <= a(1) xor a(4);
	aC <= a(2) xor a(7);
	aD <= a(3) xor a(6);
    
	q <= 	(a(6) xor aB) & 
			(a(3) xor aA) & 
			(a(4) xor aC) & 
			(a(1) xor aD) & 
			(a(2) xor aA) & 
			((not a(7)) xor aB) & 
			(a(0) xor aD) & 
			((not a(5)) xor aC);



end struct;