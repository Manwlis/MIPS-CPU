library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Cmov_ControlUnit is
    Port ( opcode : in  STD_LOGIC_VECTOR (5 downto 0);
           cmov_control : out  STD_LOGIC);
end Cmov_ControlUnit;

architecture Behavioral of Cmov_ControlUnit is

begin
	Cmov_controlProcess: process (opcode)
		begin
		if opcode = "100001" then 
			cmov_control <= '1';
		else
			cmov_control <= '0';
		end if;
	end process;	
end Behavioral;

