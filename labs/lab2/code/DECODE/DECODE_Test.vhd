--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:36:28 02/19/2017
-- Design Name:   
-- Module Name:   C:/Users/Mike/Desktop/organwsh/DECODE/DECODE_Test.vhd
-- Project Name:  DECODE
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DECODE
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
 
ENTITY DECODE_Test IS
END DECODE_Test;
 
ARCHITECTURE behavior OF DECODE_Test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DECODE
    PORT(
         Instr : IN  std_logic_vector(31 downto 0);
         RF_WrEn : IN  std_logic;
         ALU_out : IN  std_logic_vector(31 downto 0);
         MEM_out : IN  std_logic_vector(31 downto 0);
         RF_WrData_sel : IN  std_logic;
         RF_B_sel : IN  std_logic;
         Clk : IN  std_logic;
         Immed : OUT  std_logic_vector(31 downto 0);
         RF_A : OUT  std_logic_vector(31 downto 0);
         RF_B : OUT  std_logic_vector(31 downto 0);
         Sl_Control : IN  std_logic;
         Zf_Se_Control : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Instr : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_WrEn : std_logic := '0';
   signal ALU_out : std_logic_vector(31 downto 0) := (others => '0');
   signal MEM_out : std_logic_vector(31 downto 0) := (others => '0');
   signal RF_WrData_sel : std_logic := '0';
   signal RF_B_sel : std_logic := '0';
   signal Clk : std_logic := '0';
   signal Sl_Control : std_logic := '0';
   signal Zf_Se_Control : std_logic := '0';

 	--Outputs
   signal Immed : std_logic_vector(31 downto 0);
   signal RF_A : std_logic_vector(31 downto 0);
   signal RF_B : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DECODE PORT MAP (
          Instr => Instr,
          RF_WrEn => RF_WrEn,
          ALU_out => ALU_out,
          MEM_out => MEM_out,
          RF_WrData_sel => RF_WrData_sel,
          RF_B_sel => RF_B_sel,
          Clk => Clk,
          Immed => Immed,
          RF_A => RF_A,
          RF_B => RF_B,
          Sl_Control => Sl_Control,
          Zf_Se_Control => Zf_Se_Control
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
	
	   Instr <= "00000000000000010000000000000110";
		RF_WrEn <= '1';
		ALU_out <= "00000000000000000000000000000001";
		MEM_out <= "00000000000000000000000000000000";
		RF_WrData_sel <= '0';
		RF_B_sel <= '1';
		Sl_Control <= '1';
		Zf_Se_Control <= '1';
		
      wait for Clk_period;	
 
      Instr <= "00000000000000100000000000000110";
		RF_WrEn <= '1';
		ALU_out <= "00000000000000000000000000000001";
		MEM_out <= "00000000000000000000000000000010";
		RF_WrData_sel <= '1';
		RF_B_sel <= '1';
		Sl_Control <= '1';
		Zf_Se_Control <= '1';
		
      wait for Clk_period;	
		
		Instr <= "00000000001000010001000000000110";
		RF_WrEn <= '0';
		ALU_out <= "00000000000000000000000000000001";
		MEM_out <= "00000000000000000000000000000000";
		RF_WrData_sel <= '0';
		RF_B_sel <= '0';
		Sl_Control <= '1';
		Zf_Se_Control <= '1';
		
      wait for Clk_period;	

      wait for Clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
