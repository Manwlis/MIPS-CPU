library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity InitializationFSM is
    Port ( PCbeforeIMEM : in  STD_LOGIC_VECTOR (31 downto 0);
           FSMstart : in  STD_LOGIC;
           FSMstartFinal : out  STD_LOGIC);
end InitializationFSM;

architecture Behavioral of InitializationFSM is

begin
InitializationProcess: process (PCbeforeIMEM, FSMstart)
	begin

	if PCbeforeIMEM = "00000000000000000000000000000000" or PCbeforeIMEM = "00000000000000000000000000000100" then
		FSMstartFinal <= '0';
	else
		FSMstartFinal <= FSMstart;
	end if;
	end process;

end Behavioral;

