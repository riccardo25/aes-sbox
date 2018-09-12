library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- interface
entity square4 is
port (
	-- data inputs
	
	data_in 			: in std_logic_vector(3 downto 0);

	-- data outputs
	
	data_out 		: out std_logic_vector(3 downto 0)

	-- control signals
	
	-- status signals
);
end square4;

architecture struct of square4 is
	

begin
	
	data_out <= data_in(3) & (data_in(1) xor data_in(3)) & data_in(2) & (data_in(0) xor data_in(2));
	
end struct;
