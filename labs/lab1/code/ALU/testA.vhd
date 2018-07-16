--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:39:35 02/10/2017
-- Design Name:   
-- Module Name:   C:/Users/Mike/Desktop/organwsh/lab1/testA.vhd
-- Project Name:  lab1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY testA IS
END testA;
 
ARCHITECTURE behavior OF testA IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         Op : IN  std_logic_vector(3 downto 0);
         Outt : INOUT  std_logic_vector(31 downto 0);
         Zero : INOUT  std_logic;
         Cout : INOUT  std_logic;
         Ovf : INOUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal Op : std_logic_vector(3 downto 0) := (others => '0');

	--BiDirs
   signal Outt : std_logic_vector(31 downto 0);
   signal Zero : std_logic;
   signal Cout : std_logic;
   signal Ovf : std_logic;
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          A => A,
          B => B,
          Op => Op,
          Outt => Outt,
          Zero => Zero,
          Cout => Cout,
          Ovf => Ovf
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      
		A <= "00000000000000000000000000000000";
		B <= "00000000000000000000000000000000";
		Op <= "1111";

-- pros8esh

      wait for 100 ns;	
		A <= "00000000000000000000000000000001"; -- + kai + xwris ovf xwris carry out
		B <= "00000000000000000000000000000010";
		Op <= "0000";
		
		wait for 100 ns;	
		A <= "10000000000000000000000000000001"; -- - kai - me ovf meT carry out
		B <= "10000000000000000000000000000010";
		Op <= "0000";
		
		wait for 100 ns;	
		A <= "11111111111111111111111111111111"; -- - kai - xwris ovf me carry out
		B <= "10000000000000000000000000000010";
		Op <= "0000";
		
		wait for 100 ns;	
		A <= "01111111111111111111111111111111"; -- + kai + me ovf xwris carry out
		B <= "01000000000000000000000000000010";
		Op <= "0000";
		
		wait for 100 ns;	
		A <= "00001111111011111111111000011111"; -- + kai - xwris carry out
		B <= "10000000000000011111000000000010";
		Op <= "0000";
		
		wait for 100 ns;	
		A <= "01001111111011111111111000011111"; -- + kai - me carry out
		B <= "11000000000000011111000000000010";
		Op <= "0000";

--afairesh

      wait for 100 ns;	
		A <= "00000000000000000000000000000001"; -- + plhn + xwris ovf xwris carry out
		B <= "00000000000000000000000000000010";
		Op <= "0001";
		
		wait for 100 ns;	
		A <= "10000000000000000000000000000001"; -- - plhn - xwris ovf xwris carry out
		B <= "10000000000000000000000000000010";
		Op <= "0001";
		
		wait for 100 ns;	
		A <= "10000011111111100111111111001111"; -- - plhn + me ovf me carry out
		B <= "01110011000000000000000000000010";
		Op <= "0001";
		
		wait for 100 ns;	
		A <= "00001111111011111111111000011111"; -- + plhn - me ovf xwris carry out
		B <= "10000000000000011111000000000010";
		Op <= "0001";
		
		wait for 100 ns;	
		A <= "10111111111111111111110000100001"; -- - plhn + xwris ovf me carry out
		B <= "00000000000000000000000001111101";
		Op <= "0001";
		
		
		wait for 100 ns;	
		A <= "01001111111011111111111000011111"; -- + plhn - xwris ovf xwris carry out
		B <= "11111111111111111111111111111111";
		Op <= "0001";



      wait for 100 ns;	
		A <= "01001001001101111001111000000111"; -- A AND B
		B <= "10000000000000001111001110111100";
		Op <= "0010";
		
      wait for 100 ns;	
		A <= "01001001001101111001111000000111"; -- A OR B
		B <= "10000000000000001111001110111100";
		Op <= "0011";
      -- insert stimulus here 
		
		wait for 100 ns;	?
		A <= "01001001001101111001111000000111"; -- antistrofi tou A
		Op <= "0100";
      
      wait for 100 ns;	
		A <= "11001001001101111001111000000111"; -- arithmitiki olisthisi deksia, tou A
		Op <= "1000";
		
		wait for 100 ns;	
		A <= "11001001001101111001111000000111"; -- logiki olisthisi deksia, tou A
		Op <= "1001";
		
		wait for 100 ns;	
		A <= "01001001001101111001111000000111"; -- arithmitiki olisthisi aristera, tou A
		Op <= "1010";
		
		wait for 100 ns;	
		A <= "01001001001101111001111000000111"; -- kikliki olisthisi aristera, tou A
		Op <= "1100";
		
		wait for 100 ns;	
		A <= "01001001001101111001111000000111"; -- kikliki olisthisi deksia, tou A
		Op <= "1101";
		
      wait;
   end process;

END;
