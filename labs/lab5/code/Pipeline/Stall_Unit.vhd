library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Stall_Unit is
    Port ( Opcode : in  STD_LOGIC_VECTOR (5 downto 0);
           WriteRegALU : in  STD_LOGIC_VECTOR (4 downto 0);
           Read_Reg1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Read_Reg2 : in  STD_LOGIC_VECTOR (4 downto 0);
           IFControl : out  STD_LOGIC;
           killCommand : out  STD_LOGIC;
           Stall_Forward : out  STD_LOGIC_VECTOR (1 downto 0)); -- 00 kanenas den allazei, 01 allazei o a, 10 allazei o b,11 kai oi 2
end Stall_Unit;

architecture Behavioral of Stall_Unit is

begin
StallControl : process(Read_Reg1,Opcode,Read_Reg2,WriteRegALU)

begin
	
	if Opcode = "001111" or Opcode = "000011" then
		if WriteRegALU = Read_Reg1 and WriteRegALU = Read_Reg2 then
			IFControl <= '0';
			killCommand <= '1';
			Stall_Forward <= "11";
		elsif WriteRegALU = Read_Reg1 then
			IFControl <= '0';
			killCommand <= '1';
			Stall_Forward <= "01";
		elsif WriteRegALU = Read_Reg2 then
			IFControl <= '0';
			killCommand <= '1';
			Stall_Forward <= "10";
		else
			IFControl <= '1';
			killCommand <= '0';
			Stall_Forward <= "00";	
		end if;
	else
		IFControl <= '1';
		killCommand <= '0';
		Stall_Forward <= "00";
	end if;

end process;


end Behavioral;

