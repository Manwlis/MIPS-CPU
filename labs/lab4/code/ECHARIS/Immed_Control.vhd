library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Immed_Control is
    Port ( Op : in  STD_LOGIC_VECTOR (5 downto 0);
           IMMEDctr : out  STD_LOGIC_VECTOR (1 downto 0));
end Immed_Control;

architecture Behavioral of Immed_Control is

begin

Immed_ControlProcess: process (Op)
	begin
	
		case Op is
		
			when "100111" => --beqRM
				IMMEDctr <= "01";
			when "111001" =>  --lui
				IMMEDctr <= "10";
			when "110010" => --andi 
				IMMEDctr <= "00";
			when "110011" => -- ori
				IMMEDctr <= "00";
			when others =>  
				IMMEDctr <= "01";
			
		end case;
	end process;
end Behavioral;

