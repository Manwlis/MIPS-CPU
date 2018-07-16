--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:27:20 02/11/2017
-- Design Name:   
-- Module Name:   C:/Users/Mike/Desktop/organwsh/lab1b/Reg4BitTest.vhd
-- Project Name:  lab1b
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Reg4Bit
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
 
ENTITY Reg4BitTest IS
END Reg4BitTest;
 
ARCHITECTURE behavior OF Reg4BitTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Reg4Bit
    PORT(
         Clk : IN  std_logic;
         WrEn : IN  std_logic;
         Din : IN  std_logic_vector(3 downto 0);
         Dout : INOUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal WrEn : std_logic := '0';
   signal Din : std_logic_vector(3 downto 0) := (others => '0');

	--BiDirs
   signal Dout : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Reg4Bit PORT MAP (
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
      WrEn <= '1';
		Din <= "0000";
		wait for Clk_period;
		
		WrEn <= '0';
		Din <= "0110";
		wait for Clk_period;
		
		WrEn <= '1';
		Din <= "0100";
		wait for Clk_period;
		

      wait for Clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
