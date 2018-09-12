
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity syncronizer is
generic( N : integer);
port (
	CLK, rst_n : in std_logic;
	D : in std_logic_vector(N-1 downto 0);
	Q : out std_logic_vector(N-1 downto 0)
);

end syncronizer;

architecture arc of syncronizer is

	component reg is
	generic( N : integer);
	port (
		CLK, rst_n : in std_logic;
		load : in std_logic;
		D : in std_logic_vector(N-1 downto 0);
		Q : out std_logic_vector(N-1 downto 0)
	);
	end component;
	
	signal sync_path: std_logic_vector(N-1 downto 0);

begin

	REG1 : reg generic map(N) port map(CLK => CLK, rst_n => rst_n, load => '1', D => D, Q => sync_path);
	REG2 : reg generic map(N) port map(CLK => CLK, rst_n => rst_n, load => '1', D => sync_path, Q => Q);



end arc;

