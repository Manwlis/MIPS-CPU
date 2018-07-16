library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity MemOutContolUnit is
    Port ( Instr : in  STD_LOGIC_VECTOR (31 downto 0);
           sizeControl : out  STD_LOGIC;
				MemOutSel : out  STD_LOGIC);
end MemOutContolUnit;

architecture Behavioral of MemOutContolUnit is

begin
MemOutControlProcess: process (Instr)
		begin
		if (Instr(31 downto 26) = "000011") or (Instr(31 downto 26) = "000111") then 
			sizeControl <= '1';
		else
			sizeControl <= '0';
		end if;
		if (Instr(31 downto 26) = "111100") then
			MemOutSel <= '1';
		else
			MemOutSel <= '0';
		end if;
	end process;	

end Behavioral;

