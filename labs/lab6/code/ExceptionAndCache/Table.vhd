
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Table is
	 Port ( Instr : in  STD_LOGIC_VECTOR (31 downto 0);
	 Sl_Control : out  STD_LOGIC;
	Zf_Se_Control : out  STD_LOGIC;
	RF_B_sel : out STD_LOGIC;
	RF_WrData_sel : out  STD_LOGIC;
	RF_WrEn : out STD_LOGIC;
	ALU_Bin_sel : out  STD_LOGIC;
	ALU_func : out STD_LOGIC_VECTOR (3 downto 0));
end Table;

architecture Behavioral of Table is

begin
ControlTable : process (Instr)
	begin
		if Instr(31 downto 26) = "101010" then
			RF_WrEn <= '0';
		elsif Instr(31 downto 26) = "100000" then 
			RF_B_sel <= '0';
			RF_WrData_sel <= '1';
			RF_WrEn <= '1';
			ALU_Bin_sel <= '0';
			if (Instr(3 downto 0) = "1001") then
					ALU_func <= "1010";--sll
			elsif (Instr(3 downto 0) = "1010") then
					ALU_func <= "1001";--srl
			else 
					ALU_func <= Instr(3 downto 0);
			end if;
		elsif Instr(31 downto 26) = "111000" then --li
			Sl_Control <= '0';
			Zf_Se_Control <= '1';
			RF_WrData_sel <= '1';
			RF_WrEn <= '1';
			ALU_Bin_sel <= '1';
			Alu_func <= "0000"; --add
						
		elsif Instr(31 downto 26) = "001111" then --lw
			Sl_Control <= '0';
			Zf_Se_Control <= '1';
			RF_B_sel <= '1';
			RF_WrData_sel <= '0';
			RF_WrEn <= '1';
			ALU_Bin_sel <= '1';
			Alu_func <= "0000"; --add	
		else --nop
			Sl_Control <= '0';
			Zf_Se_Control <= '0';
			RF_B_sel <= '0';
			RF_WrData_sel <= '0';
			RF_WrEn <= '0';
			ALU_Bin_sel <= '0';
			ALU_func <= "1111";
		end if;
		
	end process;


end Behavioral;

