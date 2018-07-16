LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY RegisterFile_Test IS
END RegisterFile_Test;
 
ARCHITECTURE behavior OF RegisterFile_Test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RegisterFile
    PORT(
         Ard1 : IN  std_logic_vector(4 downto 0);
         Ard2 : IN  std_logic_vector(4 downto 0);
         Awr : IN  std_logic_vector(4 downto 0);
         Dout1 : OUT  std_logic_vector(31 downto 0);
         Dout2 : OUT  std_logic_vector(31 downto 0);
         Din : IN  std_logic_vector(31 downto 0);
         WrEn : IN  std_logic;
         Clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Ard1 : std_logic_vector(4 downto 0) := (others => '0');
   signal Ard2 : std_logic_vector(4 downto 0) := (others => '0');
   signal Awr : std_logic_vector(4 downto 0) := (others => '0');
   signal Din : std_logic_vector(31 downto 0) := (others => '0');
   signal WrEn : std_logic := '0';
   signal Clk : std_logic := '0';

 	--Outputs
   signal Dout1 : std_logic_vector(31 downto 0);
   signal Dout2 : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RegisterFile PORT MAP (
          Ard1 => Ard1,
          Ard2 => Ard2,
          Awr => Awr,
          Dout1 => Dout1,
          Dout2 => Dout2,
          Din => Din,
          WrEn => WrEn,
          Clk => Clk
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
      
		Ard1 <= "00000";
		Ard2 <= "00000";
		Awr <= "00000";
		Din <= "11111100000000000000000000000000";
		WrEn <= '1';
		wait for Clk_period;
		
		Ard1 <= "00000";
		Ard2 <= "00000";
		Awr <= "00001";
		Din <= "00000000000000000000000000000000";
		WrEn <= '0';
		wait for Clk_period;
		
		Ard1 <= "00001";
		Ard2 <= "00000";
		Awr <= "00010";
		Din <= "01111100000000000000000000000000";
		WrEn <= '1';
		wait for Clk_period;
		
		Ard1 <= "00010";
		Ard2 <= "00001";
		Awr <= "00011";
		Din <= "00111100000000000000000000000000";
		WrEn <= '1';
		wait for Clk_period;
		
		Ard1 <= "01010";
		Ard2 <= "01001";
		Awr <= "01011";
		Din <= "00111100000000000110000000000000";
		WrEn <= '1';
		wait for Clk_period;

      wait for Clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
