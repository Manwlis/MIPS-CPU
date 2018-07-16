library IEEE;
USE ieee.std_logic_1164.ALL;
 
ENTITY FSM_test IS
END FSM_test;
 
ARCHITECTURE behavior OF FSM_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FSM
    PORT(
         Instr : IN  std_logic_vector(31 downto 0);
         Reset : IN  std_logic;
         Clk : IN  std_logic;
         Zero : IN  std_logic;
         RF_B_sel : OUT  std_logic;
         RF_WrData_sel : OUT  std_logic;
         RF_WrEn : OUT  std_logic;
         ALU_Bin_sel : OUT  std_logic;
         MEM_WrEn : OUT  std_logic;
         PC_SEL : OUT  std_logic;
         PC_LdEn : OUT  std_logic;
         sizeControl : OUT  std_logic;
         IR_Control : OUT  std_logic;
         S_control : OUT  std_logic;
         A_Control : OUT  std_logic;
         ALUop : OUT  std_logic_vector(2 downto 0);
         B_Control : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Instr : std_logic_vector(31 downto 0) := (others => '0');
   signal Reset : std_logic := '0';
   signal Clk : std_logic := '0';
   signal Zero : std_logic := '0';

 	--Outputs
   signal RF_B_sel : std_logic;
   signal RF_WrData_sel : std_logic;
   signal RF_WrEn : std_logic;
   signal ALU_Bin_sel : std_logic;
   signal MEM_WrEn : std_logic;
   signal PC_SEL : std_logic;
   signal PC_LdEn : std_logic;
   signal sizeControl : std_logic;
   signal IR_Control : std_logic;
   signal S_control : std_logic;
   signal A_Control : std_logic;
   signal ALUop : std_logic_vector(2 downto 0);
   signal B_Control : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FSM PORT MAP (
          Instr => Instr,
          Reset => Reset,
          Clk => Clk,
          Zero => Zero,
          RF_B_sel => RF_B_sel,
          RF_WrData_sel => RF_WrData_sel,
          RF_WrEn => RF_WrEn,
          ALU_Bin_sel => ALU_Bin_sel,
          MEM_WrEn => MEM_WrEn,
          PC_SEL => PC_SEL,
          PC_LdEn => PC_LdEn,
          sizeControl => sizeControl,
          IR_Control => IR_Control,
          S_control => S_control,
          A_Control => A_Control,
          ALUop => ALUop,
          B_Control => B_Control
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	   Reset <= '1';
		wait for Clk_period/2;	
		
		Reset <= '0';	--nop
      Instr <= "00000000000000000000000000000000"; --nop
      wait for Clk_period*2;	
		
		Instr <= "11100000000000010000000000000010"; --li
      wait for Clk_period*4;	
		
		Instr <= "10000000010001100001000000110000"; --add
      wait for Clk_period*4;			

		Instr <= "11000000100010010000000000000100"; --addi
      wait for Clk_period*4;	
				
		Instr <= "11100000000000000000000000001011"; -- li akurh entoli prepei na bgalei nop
      wait for Clk_period*4;	
		
      Instr <= "11111100000000000000000000000011"; -- b
      wait for Clk_period*2;
		
      Instr <= "00000000000000000000000000000000"; -- nop
      wait for Clk_period*2;
		
		Zero <= '0';
      Instr <= "00000001110000100000000000000011"; -- beq
      wait for Clk_period*4;		
		
		Zero <= '1';
      Instr <= "00000001110000100000000000000011"; -- beq
      wait for Clk_period*4;	
		
      Instr <= "01111100011001010000000000000100"; -- sw
      wait for Clk_period*4;

      Instr <= "00011101111010100000000000001000"; -- sb
      wait for Clk_period*4;
		
      Instr <= "00111101010100100000000000000010"; -- lw
      wait for Clk_period*4;

      Instr <= "00001100000100110000000000001000"; -- lb
      wait for Clk_period*4;		

      -- insert stimulus here 

      wait;
   end process;

END;
