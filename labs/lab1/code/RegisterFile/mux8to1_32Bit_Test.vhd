--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:52:51 02/11/2017
-- Design Name:   
-- Module Name:   C:/Users/Mike/Desktop/organwsh/lab1b/mux8to1_32Bit_Test.vhd
-- Project Name:  lab1b
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux8to1_32Bit
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
 
ENTITY mux8to1_32Bit_Test IS
END mux8to1_32Bit_Test;
 
ARCHITECTURE behavior OF mux8to1_32Bit_Test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux8to1_32Bit
    PORT(
         in0 : IN  std_logic_vector(31 downto 0);
         in1 : IN  std_logic_vector(31 downto 0);
         in2 : IN  std_logic_vector(31 downto 0);
         in3 : IN  std_logic_vector(31 downto 0);
         in4 : IN  std_logic_vector(31 downto 0);
         in5 : IN  std_logic_vector(31 downto 0);
         in6 : IN  std_logic_vector(31 downto 0);
         in7 : IN  std_logic_vector(31 downto 0);
         sel : IN  std_logic_vector(2 downto 0);
         output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal in0 : std_logic_vector(31 downto 0) := (others => '0');
   signal in1 : std_logic_vector(31 downto 0) := (others => '0');
   signal in2 : std_logic_vector(31 downto 0) := (others => '0');
   signal in3 : std_logic_vector(31 downto 0) := (others => '0');
   signal in4 : std_logic_vector(31 downto 0) := (others => '0');
   signal in5 : std_logic_vector(31 downto 0) := (others => '0');
   signal in6 : std_logic_vector(31 downto 0) := (others => '0');
   signal in7 : std_logic_vector(31 downto 0) := (others => '0');
   signal sel : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux8to1_32Bit PORT MAP (
          in0 => in0,
          in1 => in1,
          in2 => in2,
          in3 => in3,
          in4 => in4,
          in5 => in5,
          in6 => in6,
          in7 => in7,
          sel => sel,
          output => output
        );

   -- Stimulus process
   stim_proc: process
   begin		
     in0 <= "00010101010101010101010101010101";
	  in1 <= "00100000000000000000000000000000";
	  in2 <= "01010101010101010101010101010101";
	  in3 <= "01110101010101010101010101010101";
	  in4 <= "10010101010101010101010101010101";
	  in5 <= "10110101010101010101010101010101";
	  in6 <= "11010101010101010101010101010101";
	  in7 <= "11110101010101010101010101010101";
	  sel <= "000";
      wait for 100 ns;	
		
		sel <= "000";
      wait for 100 ns;	
		
		sel <= "001";
      wait for 100 ns;	
		
		sel <= "010";
      wait for 100 ns;	
		
		sel <= "011";
      wait for 100 ns;	
		
		
		sel <= "100";
      wait for 100 ns;	
		
		sel <= "101";
      wait for 100 ns;	

	   sel <= "110";
      wait for 100 ns;	
		
		sel <= "111";
      wait for 100 ns;	
      -- insert stimulus here 

      wait;
   end process;

END;
