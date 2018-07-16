--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:31:53 02/12/2017
-- Design Name:   
-- Module Name:   C:/Users/Mike/Desktop/organwsh/lab1b/reg32bit_test.vhd
-- Project Name:  lab1b
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Reg32Bit
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
 
ENTITY reg32bit_test IS
END reg32bit_test;
 
ARCHITECTURE behavior OF reg32bit_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Reg32Bit
    PORT(
         Clk : IN  std_logic;
         WrEn : IN  std_logic;
         Din : IN  std_logic_vector(31 downto 0);
         Dout : INOUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal WrEn : std_logic := '0';
   signal Din : std_logic_vector(31 downto 0) := (others => '0');

	--BiDirs
   signal Dout : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Reg32Bit PORT MAP (
          Clk => Clk,
          WrEn => WrEn,
          Din => Din,
          Dout => Dout
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

WrEn <= '1';
Din <= "00000000000000000000000000000000";
 wait for Clk_period;
 
 WrEn <= '0';
Din <= "11111000000000000000000000000000";
 wait for Clk_period;
 
 WrEn <= '1';
Din <= "11100000000000000000000000000000";
 wait for Clk_period;
 
 WrEn <= '0';
Din <= "00000000000000000000000000000000";
 wait for Clk_period;
 
 
 
      wait for Clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
