library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity exceptionFinder is
    Port ( Instr : in  STD_LOGIC_VECTOR (31 downto 0);
	 PC_sel : out STD_LOGIC_VECTOR (1 downto 0);
	 FSMstart : out STD_LOGIC;
	 killAsynchronous : out STD_LOGIC;
	 JumpFound  : out STD_LOGIC;
	 cs : out STD_LOGIC_VECTOR (31 downto 0);
	 address  : in  STD_LOGIC_VECTOR (31 downto 0));
end exceptionFinder;

architecture Behavioral of exceptionFinder is

begin

exceptionFinderProcess: process (Instr, address)
	begin
		if (Instr(31 downto 26) = "001111") and (not(address(31 downto 12) = "00000000000000000000")) then
			PC_sel <= "10"; --ADDRL
			cs <= "00010001000100010000000000000000"; --0x11110000
			killAsynchronous <= '1';
			FSMstart <= '1';
		elsif NOT((Instr(31 downto 26) = "001111") or --lw
		(Instr(31 downto 26) = "100000") or --add
		(Instr(31 downto 26) = "111000") or  --li
		(Instr(31 downto 26) = "101010") or --jump_epc
		(Instr = "00000000000000000000000000000000")) then--nop
			PC_sel <= "01"; --IBUS
			cs <= "00000000000000000001000100010001"; --0x00001111
			killAsynchronous <= '1';
			FSMstart <= '1';
		elsif (Instr(31 downto 26) = "100000") and (NOT(Instr(5 downto 0) = "110000")) then --add me lathos func
			PC_sel <= "01"; --IBUS
			cs <= "00000000000000000001000100010001"; --0x00001111
			killAsynchronous <= '1';
			FSMstart <= '1';
		else 
			PC_sel <= "00";
			cs <= "00000000000000000000000000000000";
			killAsynchronous <= '0';
			FSMstart <= '0';
		end if;
			
	end process;
	
jumpFinderProcess: process (Instr)
	begin
		if Instr(31 downto 26) = "101010" then
			JumpFound <= '1';
		else 
			JumpFound <= '0';
		end if;
	end process;
	
end Behavioral;

