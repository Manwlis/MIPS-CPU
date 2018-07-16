
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY mux32to1_32Bit_Test IS
END mux32to1_32Bit_Test;
 
ARCHITECTURE behavior OF mux32to1_32Bit_Test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux32to1_32Bit
    PORT(
         in0 : IN  std_logic_vector(31 downto 0);
         in1 : IN  std_logic_vector(31 downto 0);
         in2 : IN  std_logic_vector(31 downto 0);
         in3 : IN  std_logic_vector(31 downto 0);
         in4 : IN  std_logic_vector(31 downto 0);
         in5 : IN  std_logic_vector(31 downto 0);
         in6 : IN  std_logic_vector(31 downto 0);
         in7 : IN  std_logic_vector(31 downto 0);
         in8 : IN  std_logic_vector(31 downto 0);
         in9 : IN  std_logic_vector(31 downto 0);
         in10 : IN  std_logic_vector(31 downto 0);
         in11 : IN  std_logic_vector(31 downto 0);
         in12 : IN  std_logic_vector(31 downto 0);
         in13 : IN  std_logic_vector(31 downto 0);
         in14 : IN  std_logic_vector(31 downto 0);
         in15 : IN  std_logic_vector(31 downto 0);
         in16 : IN  std_logic_vector(31 downto 0);
         in17 : IN  std_logic_vector(31 downto 0);
         in18 : IN  std_logic_vector(31 downto 0);
         in19 : IN  std_logic_vector(31 downto 0);
         in20 : IN  std_logic_vector(31 downto 0);
         in21 : IN  std_logic_vector(31 downto 0);
         in22 : IN  std_logic_vector(31 downto 0);
         in23 : IN  std_logic_vector(31 downto 0);
         in24 : IN  std_logic_vector(31 downto 0);
         in25 : IN  std_logic_vector(31 downto 0);
         in26 : IN  std_logic_vector(31 downto 0);
         in27 : IN  std_logic_vector(31 downto 0);
         in28 : IN  std_logic_vector(31 downto 0);
         in29 : IN  std_logic_vector(31 downto 0);
         in30 : IN  std_logic_vector(31 downto 0);
         in31 : IN  std_logic_vector(31 downto 0);
         sel : IN  std_logic_vector(4 downto 0);
         output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal in0 : std_logic_vector(31 downto 0) := (others => '0');
   signal in1 : std_logic_vector(31 downto 0) := (others => '0');
   signal in2 : std_logic_vector(31 downto 0) := (others => '0');
   signal in3 : std_logic_vector(31 downto 0) := (others => '0');
   signal in4 : std_logic_vector(31 downto 0) := (others => '0');
   signal in5 : std_logic_vector(31 downto 0) := (others => '0');
   signal in6 : std_logic_vector(31 downto 0) := (others => '0');
   signal in7 : std_logic_vector(31 downto 0) := (others => '0');
   signal in8 : std_logic_vector(31 downto 0) := (others => '0');
   signal in9 : std_logic_vector(31 downto 0) := (others => '0');
   signal in10 : std_logic_vector(31 downto 0) := (others => '0');
   signal in11 : std_logic_vector(31 downto 0) := (others => '0');
   signal in12 : std_logic_vector(31 downto 0) := (others => '0');
   signal in13 : std_logic_vector(31 downto 0) := (others => '0');
   signal in14 : std_logic_vector(31 downto 0) := (others => '0');
   signal in15 : std_logic_vector(31 downto 0) := (others => '0');
   signal in16 : std_logic_vector(31 downto 0) := (others => '0');
   signal in17 : std_logic_vector(31 downto 0) := (others => '0');
   signal in18 : std_logic_vector(31 downto 0) := (others => '0');
   signal in19 : std_logic_vector(31 downto 0) := (others => '0');
   signal in20 : std_logic_vector(31 downto 0) := (others => '0');
   signal in21 : std_logic_vector(31 downto 0) := (others => '0');
   signal in22 : std_logic_vector(31 downto 0) := (others => '0');
   signal in23 : std_logic_vector(31 downto 0) := (others => '0');
   signal in24 : std_logic_vector(31 downto 0) := (others => '0');
   signal in25 : std_logic_vector(31 downto 0) := (others => '0');
   signal in26 : std_logic_vector(31 downto 0) := (others => '0');
   signal in27 : std_logic_vector(31 downto 0) := (others => '0');
   signal in28 : std_logic_vector(31 downto 0) := (others => '0');
   signal in29 : std_logic_vector(31 downto 0) := (others => '0');
   signal in30 : std_logic_vector(31 downto 0) := (others => '0');
   signal in31 : std_logic_vector(31 downto 0) := (others => '0');
   signal sel : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux32to1_32Bit PORT MAP (
          in0 => in0,
          in1 => in1,
          in2 => in2,
          in3 => in3,
          in4 => in4,
          in5 => in5,
          in6 => in6,
          in7 => in7,
          in8 => in8,
          in9 => in9,
          in10 => in10,
          in11 => in11,
          in12 => in12,
          in13 => in13,
          in14 => in14,
          in15 => in15,
          in16 => in16,
          in17 => in17,
          in18 => in18,
          in19 => in19,
          in20 => in20,
          in21 => in21,
          in22 => in22,
          in23 => in23,
          in24 => in24,
          in25 => in25,
          in26 => in26,
          in27 => in27,
          in28 => in28,
          in29 => in29,
          in30 => in30,
          in31 => in31,
          sel => sel,
          output => output
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
	  in0 <= "00010101010101010101010101010101";
	  in1 <= "00100000000000000000000000000000";
	  in2 <= "01010101010101010101010101010101";
	  in3 <= "01110101010101010101010101010101";
	  in4 <= "10010101010101010101010101010101";
	  in5 <= "10110101010101010101010101010101";
	  in6 <= "11010101010101010101010101010101";
	  in7 <= "11110101010101010101010101010101";
	  in8 <= "11111000000000000000000000000000";
	  in9 <= "11111100000000000000000000000000";
	  in10 <= "11111110000000000000000000000000";
	  in11 <= "11111111000000000000000000000000";
	  in12 <= "11111111100000000000000000000000";
	  in13 <= "11111111110000000000000000000000";
	  in14 <= "11111111111000000000000000000000";
	  in15 <= "11111111111100000000000000000000";	  
	  in16 <= "11111111111110000000000000000000";
	  in17 <= "11111111111111000000000000000000";
	  in18 <= "11111111111111100000000000000000";
	  in19 <= "11111111111111110000000000000000";
	  in20 <= "11111111111111111000000000000000";
	  in21 <= "11111111111111111100000000000000";
	  in22 <= "11111111111111111110000000000000";
	  in23 <= "11111111111111111111000000000000";
	  in24 <= "11111111111111111111100000000000";
	  in25 <= "11111111111111111111110000000000";
	  in26 <= "11111101111111111111111000000000";
	  in27 <= "11111111111111111111111100000000";
	  in28 <= "11111111111111111111111110000000";
	  in29 <= "11111111111111111111111111000000";
	  in30 <= "11111111111111111111111111110000";
	  in31 <= "11111111111111111111111111111000"; 	  
	  sel <= "00000";
	  wait for 100 ns;	
	  
	  sel <= "00001";
	  wait for 100 ns;    
	  
	  sel <= "00010";
	  wait for 100 ns;
	  
	  sel <= "11111";
	  wait for 100 ns;   

	  sel <= "10100";
	  wait for 100 ns;

	  sel <= "11001";
	  wait for 100 ns;       	  

	  sel <= "00111";
	  wait for 100 ns;   
     wait;
	  
	  sel <= "01100";
	  wait for 100 ns;   		
		
		
	  sel <= "00011";
	  wait for 100 ns;   	
	  
	  sel <= "01000";
	  wait for 100 ns;   	
	  
   end process;

END;
