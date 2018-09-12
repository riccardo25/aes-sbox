library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- interface
entity mapp is
port (
	-- data inputs
	
	data_in 			: in std_logic_vector(7 downto 0);

	-- data outputs
	
	a_h 				: out std_logic_vector(3 downto 0);
	a_l	 			: out std_logic_vector(3 downto 0)

	-- control signals
	
	-- status signals
);
end mapp;

architecture struct of mapp is
	
	signal aA, aB, aC 	: std_logic;
	

begin

	aA <= data_in(1) xor data_in(7);
   aB <= data_in(5) xor data_in(7);
   aC <= data_in(4) xor data_in(6);
	
	a_h <= aB & (aB xor data_in(2) xor data_in(3)) & (aC xor aA) & (aC xor data_in(5));
	a_l <= (data_in(2) xor data_in(4)) & aA & (data_in(1) xor data_in(2)) & (aC xor data_in(0) xor data_in(5));
	
end struct;
