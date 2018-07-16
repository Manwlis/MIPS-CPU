--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:17:49 02/11/2017
-- Design Name:   
-- Module Name:   C:/Users/Mike/Desktop/organwsh/lab1b/demux2to4_Test.vhd
-- Project Name:  lab1b
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: demux2to4
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
 
ENTITY demux2to4_Test IS
END demux2to4_Test;
 
ARCHITECTURE behavior OF demux2to4_Test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT demux2to4
    PORT(
         s : IN  std_logic_vector(1 downto 0);
         input : IN  std_logic;
         output : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal s : std_logic_vector(1 downto 0) := (others => '0');
   signal input : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: demux2to4 PORT MAP (
          s => s,
          input => input,
          output => output
        );

   -- Clock process definitions

   -- Stimulus process
   stim_proc: process
   begin		
      
		input <= '1';
		s <= "00";
      wait for 100 ns;	
		
				s <= "01";
      wait for 100 ns;
		
				s <= "10";
      wait for 100 ns;	
		
				s <= "11";	



      -- insert stimulus here 

      wait;
   end process;

END;
