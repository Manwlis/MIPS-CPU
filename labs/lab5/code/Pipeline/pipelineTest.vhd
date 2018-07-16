--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:42:53 04/02/2017
-- Design Name:   
-- Module Name:   C:/Users/Mike/Desktop/organwsh/lab5/Pipeline/pipelineTest.vhd
-- Project Name:  Pipeline
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PipelinedProcessor
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
 
ENTITY pipelineTest IS
END pipelineTest;
 
ARCHITECTURE behavior OF pipelineTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PipelinedProcessor
    PORT(
         Clk : IN  std_logic;
         Reset : IN  std_logic;
         Instruction : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Reset : std_logic := '0';

 	--Outputs
   signal Instruction : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PipelinedProcessor PORT MAP (
          Clk => Clk,
          Reset => Reset,
          Instruction => Instruction
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
		Reset <= '1';
		wait for Clk_period/2;
		
      Reset <= '0';
      wait for Clk_period*1000;

   end process;

END;
