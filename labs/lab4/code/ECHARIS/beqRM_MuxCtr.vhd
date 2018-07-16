library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity beqRM_MuxCtr is
Port(
		Instr : in  STD_LOGIC_VECTOR (31 downto 0);
		ALU_in0ctr : out  STD_LOGIC;
		MEMAddrCtr : out  STD_LOGIC;
		PCAdderCtr : out  STD_LOGIC);
end beqRM_MuxCtr;

architecture Behavioral of beqRM_MuxCtr is

begin
FSM_Process: process (Instr)
	begin
	if Instr(31 downto 26) = "101111" then --bneMEM
		ALU_in0ctr <= '0';
		MEMAddrCtr <= '0';
		PCAdderCtr <= '1';
	elsif Instr(31 downto 26) = "100111" then --beqRM
		ALU_in0ctr <= '0';
		MEMAddrCtr <= '1';
		PCAdderCtr <= '0';
	else
		ALU_in0ctr <= '1';
		MEMAddrCtr <= '0';
		PCAdderCtr <= '1';
	end if;

	end process;
end Behavioral;

