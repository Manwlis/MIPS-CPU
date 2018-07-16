library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_Control is
    Port ( func : in  STD_LOGIC_VECTOR (3 downto 0);
           ALUop : in  STD_LOGIC_VECTOR (2 downto 0);
           ALUctr : out  STD_LOGIC_VECTOR (3 downto 0));
end ALU_Control;

architecture Behavioral of ALU_Control is

begin

ALU_controlProcess: process (func,ALUop)
	begin
	
		case ALUop is
		
			when "100" =>--R-type
				if (func = "1001") then
					ALUctr <= "1010";--sll
				elsif (func = "1010") then
					ALUctr <= "1001";--srl
				else ALUctr <= func;
				end if;
			
			when "000" =>--add
				ALUctr <= "0000";
			
			when"001" =>--and
				ALUctr <= "0010";
				
			when "010" =>--or
				ALUctr <= "0011";
			
			when"011" =>--sub
				ALUctr <= "0001";
				
			when others => 
				ALUctr <= "1111";
			
		end case;
	end process;
end Behavioral;

