
-- VHDL Instantiation Created from source file RegisterFile.vhd -- 20:17:24 02/12/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT RegisterFile
	PORT(
		Ard1 : IN std_logic_vector(4 downto 0);
		Ard2 : IN std_logic_vector(4 downto 0);
		Awr : IN std_logic_vector(4 downto 0);
		Din : IN std_logic_vector(31 downto 0);
		WrEn : IN std_logic;
		Clk : IN std_logic;          
		Dout1 : OUT std_logic_vector(31 downto 0);
		Dout2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_RegisterFile: RegisterFile PORT MAP(
		Ard1 => ,
		Ard2 => ,
		Awr => ,
		Dout1 => ,
		Dout2 => ,
		Din => ,
		WrEn => ,
		Clk => 
	);


