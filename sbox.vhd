library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- interface
entity sbox is
port (

	CLK, rst_n 		: in std_logic;
	-- data inputs
	
	data_in 			: in std_logic_vector(7 downto 0);

	-- data outputs
	
	data_out 		: out std_logic_vector(7 downto 0);

	-- control signals

	enc				: in std_logic
	
	-- status signals
);
end sbox;

architecture struct of sbox is

	component aff_trans is
	port (
		a 			: in std_logic_vector(7 downto 0);
		q 			: out std_logic_vector(7 downto 0)
	);
	end component;
	
	component inv_aff_trans is
	port (
		a 			: in std_logic_vector(7 downto 0);
		q 			: out std_logic_vector(7 downto 0)
	);
	end component;

	component inv8 is
	port (
		CLK		: in std_logic;
		a 			: in std_logic_vector(7 downto 0);
		q 			: out std_logic_vector(7 downto 0)
	);
	end component;
	
--	component syncronizer is
--	generic( N : integer);
--	port (
--		CLK, rst_n : in std_logic;
--		D : in std_logic_vector(N-1 downto 0);
--		Q : out std_logic_vector(N-1 downto 0)
--	);
--
--	end component;

	signal enc_sync, enc1		: std_logic;
	signal in_sync, invtras, ininvers, outinvers, outtrasf, pipe, pre_sync		: std_logic_vector(7 downto 0);

begin

	enc_sync<= enc when rising_edge(CLK) else enc_sync;
	in_sync<= data_in when rising_edge(CLK) else in_sync;
	

	INVTRAS1 : inv_aff_trans port map( a=> in_sync, q=> invtras);
	
	ininvers <= in_sync when enc_sync = '1' else invtras;
	
	INV1 : inv8 port map( CLK => CLK, a=> ininvers, q=> outinvers);

	--pipe <= outinvers when rising_edge(CLK);
	enc1 <= enc_sync when rising_edge(CLK) else enc1;

	AFFTRANS1: aff_trans port map( a=> outinvers, q=> outtrasf);
	
	data_out <= outtrasf when enc1 = '1' else outinvers;
	
--	process(enc)
--	begin
--		if(falling_edge(enc)) then
--			data_out <= "01000000";
--		elsif (rising_edge(enc))then
--			data_out <= "01000100";
--		end if;
--		
--	end process;
	
	
--SYNC2: syncronizer generic map(8) port map(CLK => CLK, rst_n => rst_n, D=>pre_sync, Q=>data_out );
	
	
end struct;