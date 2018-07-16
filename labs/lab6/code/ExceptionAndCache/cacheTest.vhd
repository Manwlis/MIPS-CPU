LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY cacheTest IS
END cacheTest;
 
ARCHITECTURE behavior OF cacheTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Cache
    PORT(
         clk : IN  std_logic;
         index : IN  std_logic_vector(4 downto 0);
         dout : OUT  std_logic_vector(131 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal index : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal dout : std_logic_vector(131 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Cache PORT MAP (
          clk => clk,
          index => index,
          dout => dout
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
