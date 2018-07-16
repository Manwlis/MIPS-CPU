----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:47:04 05/07/2017 
-- Design Name: 
-- Module Name:    hitFinder - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity hitFinder is
    Port ( TagInstr : in  STD_LOGIC_VECTOR (2 downto 0);
           Tag : in  STD_LOGIC_VECTOR (2 downto 0);
           Valid : in  STD_LOGIC;
           Instr : in  STD_LOGIC_VECTOR (5 downto 0);
           hit : out  STD_LOGIC;
				hitOut : out STD_LOGIC);
end hitFinder;

architecture Behavioral of hitFinder is

begin

ControlTable : process (TagInstr, Tag, Valid, Instr)
	begin
		if Instr = "001111" then--load
			if Valid = '1' and TagInstr = Tag then--hit
				hit <= '1';
				hitOut <= '1';
			else --miss
				hit <= '0';
				hitOut <= '0';
			end if;
		else --alles entoles
			hit <= '1';--gia na mhn skwtosei thn entolh
			hitOut <= '0';-- gia na doume to hit sto simulate
		end if;
end process;	
end Behavioral;

