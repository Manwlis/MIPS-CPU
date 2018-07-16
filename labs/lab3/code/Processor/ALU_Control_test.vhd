LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ALU_Control_test IS
END ALU_Control_test;
 
ARCHITECTURE behavior OF ALU_Control_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU_Control
    PORT(
         func : IN  std_logic_vector(3 downto 0);
         ALUop : IN  std_logic_vector(2 downto 0);
         ALUctr : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal func : std_logic_vector(3 downto 0) := (others => '0');
   signal ALUop : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal ALUctr : std_logic_vector(3 downto 0);
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU_Control PORT MAP (
          func => func,
          ALUop => ALUop,
          ALUctr => ALUctr
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
	
		ALUop <= "100";
		func <= "0000";
      wait for 100 ns;	
		func <= "1001";
      wait for 100 ns;
		func <= "1010";
      wait for 100 ns;
		ALUop <= "000";
      wait for 100 ns;
		ALUop <= "001";
      wait for 100 ns;
		ALUop <= "010";
      wait for 100 ns;
		ALUop <= "011";
      wait for 100 ns;
		ALUop <= "111";


      -- insert stimulus here 

      wait;
   end process;

END;
