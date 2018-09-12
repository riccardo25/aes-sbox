library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- interface
entity inv_map is
port (
	-- data inputs
	
	a_h 				: in std_logic_vector(3 downto 0);
	a_l	 			: in std_logic_vector(3 downto 0);
	
	-- data outputs
	
	a		 			: out std_logic_vector(7 downto 0)

	-- control signals
	
	-- status signals
);
end inv_map;

architecture struct of inv_map is
	
	signal aA, aB, aC 	: std_logic;
	

begin

	aA <= a_l(1) xor a_h(3);
   aB <= a_h(0) xor a_h(1);	
	
	a <= (aB xor a_l(2) xor a_h(3)) & (aA xor a_l(2) xor a_l(3) xor a_h(0)) & (aB xor a_l(2)) & (aA xor aB xor a_l(3)) & (aB xor a_l(1) xor a_h(2)) & (aA xor aB) & (aB xor a_h(3)) & (a_l(0) xor a_h(0));

	
end struct;