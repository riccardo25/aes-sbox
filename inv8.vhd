library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- interface
entity inv8 is
port (
	-- data inputs
	CLK : in std_logic;
	
	a 			: in std_logic_vector(7 downto 0);

	-- data outputs
	
	q 			: out std_logic_vector(7 downto 0)

	-- control signals
	
	-- status signals
);
end inv8;

architecture struct of inv8 is

component mapp is
port (
	data_in 			: in std_logic_vector(7 downto 0);
	a_h 				: out std_logic_vector(3 downto 0);
	a_l	 			: out std_logic_vector(3 downto 0)
);
end component;

component square4 is
port (
	data_in 			: in std_logic_vector(3 downto 0);
	data_out 		: out std_logic_vector(3 downto 0)
);
end component;

component mul4 is
port (
	a 			: in std_logic_vector(3 downto 0);
	b 			: in std_logic_vector(3 downto 0);
	q 			: out std_logic_vector(3 downto 0)
);
end component;

component mule is
port (
	a 			: in std_logic_vector(3 downto 0);
	q 			: out std_logic_vector(3 downto 0)
);
end component;

component inv4 is
port (
	a 			: in std_logic_vector(3 downto 0);
	q 			: out std_logic_vector(3 downto 0)
);
end component;

component inv_map is
port (
	a_h 				: in std_logic_vector(3 downto 0);
	a_l	 			: in std_logic_vector(3 downto 0);
	a		 			: out std_logic_vector(7 downto 0)
);
end component;


	
	signal 	sig1h, sig1l, sig2h, sig2l, sig3, 
				sig4, sig5, sig6, sig7, sig8, 
				sig9, sig10, pipesig1h, pipesig4			: std_logic_vector(3 downto 0);


	

begin

	MAP1: mapp port map(data_in => a, a_h => sig1h, a_l =>sig1l);
	SQ1 : square4 port map(data_in => sig1h, data_out => sig2h);
	SQ2 : square4 port map(data_in => sig1l, data_out => sig2l);
	MUL1: mul4 port map(a => sig1h, b => sig1l, q =>sig3);
	
	sig4 <= sig1h xor sig1l;
	MULE1: mule port map(a => sig2h, q =>sig5);
	
	-- PIPELINE
	pipesig1h <= sig1h when rising_edge(CLK);
	pipesig4 <= sig4 when rising_edge(CLK);
	sig7 <= ((sig5 xor sig2l) xor sig3) when rising_edge(CLK);
	
	
	INV1: inv4 port map(a => sig7, q =>sig8);
	MUL2: mul4 port map(a => pipesig1h, b => sig8, q =>sig9);
	MUL3: mul4 port map(a => sig8, b => pipesig4, q =>sig10);
	INVMAP1: inv_map port map(a_h => sig9, a_l => sig10, a => q);
	
			
end struct;

