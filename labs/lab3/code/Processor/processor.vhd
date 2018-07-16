library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity processor is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
			  instrOut : out STD_LOGIC_VECTOR (31 downto 0));
end processor;

architecture Structural of processor is

COMPONENT CONTROL 
Port (
	Instr : in  STD_LOGIC_VECTOR (31 downto 0);
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
END COMPONENT;

COMPONENT Datapath 
Port (
	Clk : in  STD_LOGIC;
	Sl_Control : in  STD_LOGIC;
	Zf_Se_Control : in  STD_LOGIC;
	RF_B_sel : in  STD_LOGIC;
	RF_WrData_sel : in  STD_LOGIC;
	RF_WrEn : in  STD_LOGIC;
	ALU_Bin_sel : in  STD_LOGIC;
	ALU_func : in  STD_LOGIC_VECTOR (3 downto 0);
	MEM_WrEn : in  STD_LOGIC;
	PC_SEL : in  STD_LOGIC;
	PC_LdEn : in  STD_LOGIC;
	Reset : in  STD_LOGIC;
	sizeControl : in  STD_LOGIC;
	Instr : inout  STD_LOGIC_VECTOR (31 downto 0);
	Zero : inout STD_LOGIC;
	IR_Control : in  STD_LOGIC;
	A_Control : in  STD_LOGIC;
	B_Control : in  STD_LOGIC;
	S_Control : in  STD_LOGIC;
	InstrBeforeIR : out STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;

signal Instr,InstrBeforeIR : STD_LOGIC_VECTOR (31 downto 0);
signal Zero, RF_B_sel, RF_WrData_sel, RF_WrEn, ALU_Bin_sel, MEM_WrEn, PC_SEL, PC_LdEn, sizeControl, IR_Control, S_control, A_Control, B_Control :STD_LOGIC;
signal ALUctr : STD_LOGIC_VECTOR (3 downto 0);
signal IMMEDctr : STD_LOGIC_VECTOR (1 downto 0);

begin

instrOut <= Instr;

CONTROL0 : CONTROL
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
		B_Control => B_Control,
		ALUctr => ALUctr,
		IMMEDctr => IMMEDctr,
		InstrBeforeIR => InstrBeforeIR);
		
Datapath0 : Datapath
	port map(
		Clk => Clk,
		Sl_Control => IMMEDctr(1),
		Zf_Se_Control => IMMEDctr(0),
		RF_B_sel => RF_B_sel,
		RF_WrData_sel => RF_WrData_sel,
		RF_WrEn => RF_WrEn,
		ALU_Bin_sel => ALU_Bin_sel,
		ALU_func => ALUctr,
		MEM_WrEn => MEM_WrEn,
		PC_SEL => PC_SEL,
		PC_LdEn => PC_LdEn,
		Reset => Reset,
		sizeControl => sizeControl,
		Instr => Instr,
		Zero => Zero,
		IR_Control => IR_Control,
		A_Control => A_Control,
		B_Control => B_Control,
		S_Control => S_Control,
		InstrBeforeIR => InstrBeforeIR);
			

end Structural;

