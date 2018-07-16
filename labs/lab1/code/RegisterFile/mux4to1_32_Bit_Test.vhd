--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:32:28 02/11/2017
-- Design Name:   
-- Module Name:   C:/Users/Mike/Desktop/organwsh/lab1b/mux4to1_32_Bit_Test.vhd
-- Project Name:  lab1b
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux4to1_32Bit
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
 
ENTITY mux4to1_32_Bit_Test IS
END mux4to1_32_Bit_Test;
 
ARCHITECTURE behavior OF mux4to1_32_Bit_Test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux4to1_32Bit
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         C : IN  std_logic_vector(31 downto 0);
         D : IN  std_logic_vector(31 downto 0);
         sel : IN  std_logic_vector(1 downto 0);
         output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal C : std_logic_vector(31 downto 0) := (others => '0');
   signal D : std_logic_vector(31 downto 0) := (others => '0');
   signal sel : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux4to1_32Bit PORT MAP (
          A => A,
          B => B,
          C => C,
          D => D,
          sel => sel,
          output => output
        );


   -- Stimulus process
   stim_proc: process
   begin		
      
		A <= "01010101010101010101010101010101";
		B <= "11111111111111111111111111111110";
		C <= "00000000000000000000000000000000";
		D <= "00001111111111111111111000000000";
		sel <= "00";
      wait for 100 ns;	

		A <= "01010101010101010101010101010101";
		B <= "11111111111111111111111111111110";
		C <= "00000000000000000000000000000000";
		D <= "00001111111111111111111000000000";
		sel <= "01";
      wait for 100 ns;	
		
		A <= "01010101010101010101010101010101";
		B <= "11111111111111111111111111111110";
		C <= "00000000000000000000000000000000";
		D <= "00001111111111111111111000000000";
		sel <= "10";
      wait for 100 ns;	
		
		A <= "01010101010101010101010101010101";
		B <= "11111111111111111111111111111110";
		C <= "00000000000000000000000000000000";
		D <= "00001111111111111111111000000000";
		sel <= "11";
	
      wait;
   end process;

END;
