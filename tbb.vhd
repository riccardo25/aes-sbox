--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:33:53 09/05/2018
-- Design Name:   
-- Module Name:   D:/Repository/XILINX/sbox/tbb.vhd
-- Project Name:  sbox
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sbox
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tbb IS
END tbb;
 
ARCHITECTURE behavior OF tbb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sbox
    PORT(
         CLK : IN  std_logic;
         rst_n : IN  std_logic;
         data_in : IN  std_logic_vector(7 downto 0);
         data_out : OUT  std_logic_vector(7 downto 0);
         enc : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal rst_n : std_logic := '0';
   signal data_in : std_logic_vector(7 downto 0) := (others => '0');
   signal enc : std_logic := '0';

 	--Outputs
   signal data_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   UUT: sbox PORT MAP (
          CLK => CLK,
          rst_n => rst_n,
          data_in => data_in,
          data_out => data_out,
          enc => enc
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 102 ns;	

      wait for CLK_period;
		rst_n <='1';
      -- insert stimulus here 
		data_in <= X"BE";
		enc <= '1';
		

		



      wait;
   end process;

END;
