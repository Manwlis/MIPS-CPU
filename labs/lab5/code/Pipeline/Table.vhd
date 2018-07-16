
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Table is
	 Port ( Instr : in  STD_LOGIC_VECTOR (31 downto 0);
	 Zero : in  STD_LOGIC;
	 Sl_Control : out  STD_LOGIC;
	Zf_Se_Control : out  STD_LOGIC;
	RF_B_sel : out STD_LOGIC;
	RF_WrData_sel : out  STD_LOGIC;
	RF_WrEn : out STD_LOGIC;
	ALU_Bin_sel : out  STD_LOGIC;
	ALU_func : out STD_LOGIC_VECTOR (3 downto 0);
	MEM_WrEn : out  STD_LOGIC;
	sizeControl : out  STD_LOGIC);
end Table;

architecture Behavioral of Table is

begin
ControlTable : process (Instr)
	begin
		if Instr(31 downto 26) = "100000" then 
			RF_B_sel <= '0';
			RF_WrData_sel <= '1';
			RF_WrEn <= '1';
			ALU_Bin_sel <= '0';
			MEM_WrEn <= '0';
	--		PC_SEL <= '0';
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
			MEM_WrEn <= '0';
		--	PC_SEL <= '0';
			Alu_func <= "0000"; --add
		elsif Instr(31 downto 26) = "111001" then --lui
			Sl_Control <= '1';
			Zf_Se_Control <= '0';
			RF_WrData_sel <= '1';
			RF_WrEn <= '1';
			ALU_Bin_sel <= '1';
			MEM_WrEn <= '0';
		--	PC_SEL <= '0';
			Alu_func <= "0000";--add
		elsif Instr(31 downto 26) = "110000" then --addi
			Sl_Control <= '0';
			Zf_Se_Control <= '1';
			RF_WrData_sel <= '1';
			RF_WrEn <= '1';
			ALU_Bin_sel <= '1';
			MEM_WrEn <= '0';
		--	PC_SEL <= '0';
			Alu_func <= "0000";--add		
		elsif Instr(31 downto 26) = "110010" then --andi
			Sl_Control <= '0';
			Zf_Se_Control <= '0';
			RF_WrData_sel <= '1';
			RF_WrEn <= '1';
			ALU_Bin_sel <= '1';
			MEM_WrEn <= '0';
		--	PC_SEL <= '0';
			Alu_func <= "0010"; --and				
		elsif Instr(31 downto 26) = "110011" then --ori
			Sl_Control <= '0';
			Zf_Se_Control <= '0';
			RF_WrData_sel <= '1';
			RF_WrEn <= '1';
			ALU_Bin_sel <= '1';
			MEM_WrEn <= '0';
	--		PC_SEL <= '0';
			Alu_func <= "0011"; --or
		elsif Instr(31 downto 26) = "111111" then --b
			Sl_Control <= '0';
			Zf_Se_Control <= '1';
			RF_WrEn <= '0';
			MEM_WrEn <= '0';
		--	PC_SEL <= '1';		
		elsif Instr(31 downto 26) = "000000" then --beq
			Sl_Control <= '0';
			Zf_Se_Control <= '1';
			RF_B_sel <= '1';
			RF_WrEn <= '0';
			ALU_Bin_sel <= '0';
			MEM_WrEn <= '0';
	--		PC_SEL <= Zero;	
			Alu_func <= "0001"; --sub
		elsif Instr(31 downto 26) = "000001" then --bne
			Sl_Control <= '0';
			Zf_Se_Control <= '1';
			RF_B_sel <= '1';
			RF_WrEn <= '0';
			ALU_Bin_sel <= '0';
			MEM_WrEn <= '0';
		--	PC_SEL <= NOT Zero;	
			Alu_func <= "0001"; --sub			
		elsif Instr(31 downto 26) = "000011" then --lb
			Sl_Control <= '0';
			Zf_Se_Control <= '1';
			RF_B_sel <= '1';
			RF_WrData_sel <= '0';
			RF_WrEn <= '1';
			ALU_Bin_sel <= '1';
			MEM_WrEn <= '0';
		--	PC_SEL <= 0;
			sizeControl <= '1';
			Alu_func <= "0000"; --add	
		elsif Instr(31 downto 26) = "000111" then --sb
			Sl_Control <= '0';
			Zf_Se_Control <= '1';
			RF_B_sel <= '1';
			RF_WrEn <= '0';
			ALU_Bin_sel <= '1';
			MEM_WrEn <= '1';
	--		PC_SEL <= 0;
			sizeControl <= '1';
			Alu_func <= "0000"; --add				
		elsif Instr(31 downto 26) = "001111" then --lw
			Sl_Control <= '0';
			Zf_Se_Control <= '1';
			RF_B_sel <= '1';
			RF_WrData_sel <= '0';
			RF_WrEn <= '1';
			ALU_Bin_sel <= '1';
			MEM_WrEn <= '0';
	--		PC_SEL <= 0;
			sizeControl <= '0';
			Alu_func <= "0000"; --add				
		elsif Instr(31 downto 26) = "011111" then --sw
			Sl_Control <= '0';
			Zf_Se_Control <= '1';
			RF_B_sel <= '1';
			RF_WrEn <= '0';
			ALU_Bin_sel <= '1';
			MEM_WrEn <= '1';
	--		PC_SEL <= 0;
			sizeControl <= '0';
			Alu_func <= "0000"; --add
		else --nop
			Sl_Control <= '0';
			Zf_Se_Control <= '0';
			RF_B_sel <= '0';
			RF_WrData_sel <= '0';
			RF_WrEn <= '0';
			ALU_Bin_sel <= '0';
			ALU_func <= "1111";
			MEM_WrEn <= '0';
	--		PC_SEL <= '0';
	--		PC_LdEn <= '0';
			sizeControl <= '0';
		end if;
		
	end process;


end Behavioral;

