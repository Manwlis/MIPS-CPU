library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Forwarding_Unit is
    Port ( Read_Reg1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Read_Reg2 : in  STD_LOGIC_VECTOR (4 downto 0);
           RF_WrEn_ALU : in  STD_LOGIC;
           WriteRegCache : in  STD_LOGIC_VECTOR (4 downto 0);
           RF_WrEn_MEM : in  STD_LOGIC;
           Stall_Forward : in  STD_LOGIC_VECTOR (1 downto 0);
           WriteReg : in  STD_LOGIC_VECTOR (4 downto 0);
           forwardCtrA : out  STD_LOGIC_VECTOR (1 downto 0);
           forwardCtrB : out  STD_LOGIC_VECTOR (1 downto 0));
end Forwarding_Unit;

architecture Behavioral of Forwarding_Unit is

begin

ForwardControl : process(Read_Reg1, Read_Reg2, RF_WrEn_ALU, WriteRegCache, RF_WrEn_MEM, WriteReg,Stall_Forward)
begin
	if Stall_Forward = "01" or Stall_Forward = "11" then
		forwardCtrA <= "11";
	else
		if (Read_Reg1 = WriteRegCache) and RF_WrEn_ALU = '1' then
			forwardCtrA <= "01";
		elsif (Read_Reg1 = WriteReg) and RF_WrEn_MEM = '1' then
			forwardCtrA <= "10";
		else
			forwardCtrA <= "00";
		end if;
	end if;

	if Stall_Forward = "10" or Stall_Forward = "11" then
		forwardCtrB <= "11";
	else
		if (Read_Reg2 = WriteRegCache) and RF_WrEn_ALU = '1' then
			forwardCtrB <= "01";
		elsif (Read_Reg2 = WriteReg) and RF_WrEn_MEM = '1' then
			forwardCtrB <= "10";
		else
			forwardCtrB <= "00";
		end if;
	end if;
	
end process;

end Behavioral;

