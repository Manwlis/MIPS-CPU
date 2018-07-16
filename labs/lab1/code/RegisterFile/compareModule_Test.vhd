--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:57:11 02/11/2017
-- Design Name:   
-- Module Name:   C:/Users/Mike/Desktop/organwsh/lab1b/compareModule_Test.vhd
-- Project Name:  lab1b
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: compareModule
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
 
ENTITY compareModule_Test IS
END compareModule_Test;
 
ARCHITECTURE behavior OF compareModule_Test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT compareModule
    PORT(
         Ard : IN  std_logic_vector(4 downto 0);
         Awr : IN  std_logic_vector(4 downto 0);
         output : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Ard : std_logic_vector(4 downto 0) := (others => '0');
   signal Awr : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: compareModule PORT MAP (
          Ard => Ard,
          Awr => Awr,
          output => output
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
	
	   Ard <= "00001";
		Awr <= "10011";
      wait for 100 ns;	
		
		Ard <= "10011";
		Awr <= "10011";
      wait for 100 ns;	

      -- insert stimulus here 

      wait;
   end process;

END;
