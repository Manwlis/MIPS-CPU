library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity InitializationUnit is
    Port ( PC_sel : in  STD_LOGIC_VECTOR (1 downto 0);
           PC_EPCmuxCtr : in  STD_LOGIC;
           PC : in  STD_LOGIC_VECTOR (31 downto 0);
           PC_selFinal : out  STD_LOGIC_VECTOR (1 downto 0);
           PC_EPCmuxCtrFinal : out  STD_LOGIC);
end InitializationUnit;

architecture Behavioral of InitializationUnit is

begin

InitializationProcess: process (PC_sel, PC_EPCmuxCtr, PC)
	begin

	if PC = "00000000000000000000000000000000" or PC = "00000000000000000000000000000100" then
		PC_selFinal <= "00";
		PC_EPCmuxCtrFinal <= '1';
	else
		PC_selFinal <= PC_sel;
		PC_EPCmuxCtrFinal <= PC_EPCmuxCtr;
	end if;
	end process;


end Behavioral;

