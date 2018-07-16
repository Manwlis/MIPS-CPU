LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY demux5to32_Test IS
END demux5to32_Test;
 
ARCHITECTURE behavior OF demux5to32_Test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT demux5to32
    PORT(
         s : IN  std_logic_vector(4 downto 0);
         output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal s : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: demux5to32 PORT MAP (
          s => s,
          output => output
        );

   

   -- Stimulus process
   stim_proc: process
   begin		
      
		s <= "00000";
		
      wait for 100 ns;	
		s <= "00001";
		
      wait for 100 ns;	
		s <= "00010";
		
      wait for 100 ns;	
		s <= "00011";
		
      wait for 100 ns;	
		s <= "00100";
		
      wait for 100 ns;	
		s <= "11000";
		
      wait for 100 ns;	
		s <= "10000";
		
      wait for 100 ns;	

		s <= "11111";
		
      wait for 100 ns;	
     

      -- insert stimulus here 

      wait;
   end process;

END;
