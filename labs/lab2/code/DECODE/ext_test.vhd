
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ext_test IS
END ext_test;
 
ARCHITECTURE behavior OF ext_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ImmedBox
    PORT(
         Instr : IN  std_logic_vector(15 downto 0);
         Immed : OUT  std_logic_vector(31 downto 0);
         Sl_Control : IN  std_logic;
         Zf_Se_Control : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Instr : std_logic_vector(15 downto 0) := (others => '0');
   signal Sl_Control : std_logic := '0';
   signal Zf_Se_Control : std_logic := '0';

 	--Outputs
   signal Immed : std_logic_vector(31 downto 0);
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ImmedBox PORT MAP (
          Instr => Instr,
          Immed => Immed,
          Sl_Control => Sl_Control,
          Zf_Se_Control => Zf_Se_Control
        );


   -- Stimulus process
   stim_proc: process
   begin		
	
	Instr <= "0000111100001111";
	Sl_Control <= '1';
	Zf_Se_Control <= '0';
      wait for 100 ns;	
		
		Instr <= "0000111100001111";
	Sl_Control <= '0';
	Zf_Se_Control <= '0';
      wait for 100 ns;	
		
		Instr <= "0000111100001111";
	Sl_Control <= '1';
	Zf_Se_Control <= '1';
      wait for 100 ns;	
		
		Instr <= "1111111100001111";
	Sl_Control <= '1';
	Zf_Se_Control <= '1';
      wait for 100 ns;	

      wait;
   end process;

END;
