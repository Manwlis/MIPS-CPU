
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity exceptionFSM is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           FSMstart : in  STD_LOGIC;
           JumpFound : in  STD_LOGIC;
           killSynchronous : out  STD_LOGIC;
           EPCenable : out  STD_LOGIC);
end exceptionFSM;

architecture Behavioral of exceptionFSM is

type state is (normalState,secondKill,thirdKill,waitForJump);
signal currentState, nextState : state;
begin

exceptionFSMprocess: process (currentState, FSMstart, JumpFound)
	begin
		case currentState is
		
			when normalState =>
				--signals
				killSynchronous <= '0';
				EPCenable <= '1';
				--next states
				if FSMstart = '1' then 
					nextState <= secondKill;
				else 
					nextState <= normalState;
				end if;
				
			when secondKill =>
				--signals			
				killSynchronous <= '1';
				EPCenable <= '0';
				 --next states
				 nextState <= thirdKill;
				 
			when thirdKill =>
				--signals			
				killSynchronous <= '1';
				EPCenable <= '0';
				 --next states
				 nextState <= waitForJump;
				 
			when waitForJump =>
				--signals			
				killSynchronous <= '0';
				EPCenable <= '0';
				 --next states
				if JumpFound = '1' then 
					nextState <= normalState ;
				else 
					nextState <= waitForJump;
				end if;
		end case;

	end process;

FSM_CLOCK:  PROCESS (Clk,Reset)
begin
	if Reset = '1' then 
		currentState <= normalState;
	elsif (rising_edge(Clk)) then 
		currentState <= nextState;
	end if;
end process;

end Behavioral;

