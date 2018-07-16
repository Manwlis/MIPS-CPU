library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CONTROL is
    Port ( Instr : in  STD_LOGIC_VECTOR (31 downto 0);
           Reset : in  STD_LOGIC;
			  Clk: in  STD_LOGIC;
			  Zero: in  STD_LOGIC;
           RF_B_sel : out  STD_LOGIC;
           RF_WrData_sel : out  STD_LOGIC;
           RF_WrEn : out  STD_LOGIC;
           ALU_Bin_sel : out  STD_LOGIC;
           MEM_WrEn : out  STD_LOGIC;
           PC_SEL : out  STD_LOGIC;
           PC_LdEn : out  STD_LOGIC;
           sizeControl : out  STD_LOGIC;
           IR_Control : out  STD_LOGIC;
           S_control : out  STD_LOGIC;
           A_Control : out  STD_LOGIC;
           B_Control : out  STD_LOGIC;
			  ALUctr : out  STD_LOGIC_VECTOR (3 downto 0);
			  IMMEDctr : out  STD_LOGIC_VECTOR (1 downto 0);
			  InstrBeforeIR : in STD_LOGIC_VECTOR (31 downto 0));
end CONTROL;

architecture Behavioral of CONTROL is

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
         B_Control : OUT  std_logic;
			InstrBeforeIR : in STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;
	 
COMPONENT ALU_Control
    PORT(
         func : IN  std_logic_vector(3 downto 0);
         ALUop : IN  std_logic_vector(2 downto 0);
         ALUctr : OUT  std_logic_vector(3 downto 0));
END COMPONENT;

COMPONENT Immed_Control
    PORT(
         Op : in  STD_LOGIC_VECTOR (5 downto 0);
         IMMEDctr : out  STD_LOGIC_VECTOR (1 downto 0));
END COMPONENT;

signal ALUop : std_logic_vector(2 downto 0);

begin

FSM0 : FSM 
port map(
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
	B_Control => B_Control,
	InstrBeforeIR => InstrBeforeIR);
	
ALU_Control0 : ALU_Control
port map(
	func => Instr(3 downto 0),
	ALUop => ALUop,
	ALUctr => ALUctr);
	
Immed_Control0 : Immed_Control
port map(
		Op => Instr(31 downto 26),
		IMMEDctr => IMMEDctr);
		

end Behavioral;

