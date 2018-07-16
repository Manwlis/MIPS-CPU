library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CONTROL is
    Port(Instr : in  STD_LOGIC_VECTOR (31 downto 0);
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
			cmov_control : out  STD_LOGIC;
			Reg8Bit31_24_WrEn  : out  STD_LOGIC;
			Reg8Bit23_16_WrEn  : out  STD_LOGIC;
			Reg8Bit15_8_WrEn  : out  STD_LOGIC;
			AddByte_Fill : out  STD_LOGIC_VECTOR (2 downto 0);
			AddByte_Empty : out  STD_LOGIC;
			ALUctr : out  STD_LOGIC_VECTOR (3 downto 0);
			IMMEDctr : out  STD_LOGIC_VECTOR (1 downto 0);
			ALU_in0ctr : out  STD_LOGIC;
			MEMAddrCtr : out  STD_LOGIC;
			PCAdderCtr : out  STD_LOGIC;
			MemtoBctr : out  STD_LOGIC;
			packByte7_0_WrEn  : out  STD_LOGIC;			  
			packByte15_8_WrEn  : out  STD_LOGIC;	
			packByte23_16_WrEn  : out  STD_LOGIC;
			Addrsel : out  STD_LOGIC;
			MemOutSel : out  STD_LOGIC;
			ASBtoMEMaddr : out  STD_LOGIC_VECTOR (1 downto 0);
			MEM_DataINSel : out  STD_LOGIC_VECTOR (2 downto 0);
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
         IR_Control : OUT  std_logic;
         S_control : OUT  std_logic;
         A_Control : OUT  std_logic;
         ALUop : OUT  std_logic_vector(2 downto 0);
         B_Control : OUT  std_logic;
			InstrBeforeIR : in STD_LOGIC_VECTOR (31 downto 0);
			Reg8Bit31_24_WrEn  : out  STD_LOGIC;
			Reg8Bit23_16_WrEn  : out  STD_LOGIC;
			Reg8Bit15_8_WrEn  : out  STD_LOGIC;
			AddByte_Fill : out STD_LOGIC_VECTOR (2 downto 0);
			AddByte_Empty : out  STD_LOGIC;
			MemtoBctr : out  STD_LOGIC;
			packByte7_0_WrEn  : out  STD_LOGIC;			  
			packByte15_8_WrEn  : out  STD_LOGIC;	
			packByte23_16_WrEn  : out  STD_LOGIC;
			MEM_DataINSel : out  STD_LOGIC_VECTOR (2 downto 0);
			Addrsel : out  STD_LOGIC;
			ASBtoMEMaddr : out  STD_LOGIC_VECTOR (1 downto 0));
END COMPONENT;
	 
COMPONENT ALU_Control
    PORT(
         func : IN  std_logic_vector(3 downto 0);
         ALUop : IN  std_logic_vector(2 downto 0);
         ALUctr : OUT  std_logic_vector(3 downto 0));
END COMPONENT;

COMPONENT beqRM_MuxCtr
    PORT(
      Instr : in  STD_LOGIC_VECTOR (31 downto 0);
		ALU_in0ctr : out  STD_LOGIC;
		MEMAddrCtr : out  STD_LOGIC;
		PCAdderCtr : out  STD_LOGIC);
END COMPONENT;

COMPONENT Immed_Control
    PORT(
         Op : in  STD_LOGIC_VECTOR (5 downto 0);
         IMMEDctr : out  STD_LOGIC_VECTOR (1 downto 0));
END COMPONENT;

COMPONENT MemOutContolUnit
    PORT(Instr : in  STD_LOGIC_VECTOR (31 downto 0);
				MemOutSel : out  STD_LOGIC;
           sizeControl : out  STD_LOGIC);
END COMPONENT;

COMPONENT Cmov_ControlUnit
    PORT(
         opcode : in  STD_LOGIC_VECTOR (5 downto 0);
         cmov_control : out  STD_LOGIC);
END COMPONENT;

signal ALUop : std_logic_vector(2 downto 0);

begin

Cmov_ControlUnit0 : Cmov_ControlUnit
port map(
	opcode => Instr(31 downto 26),
	cmov_control => cmov_control);

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
	IR_Control => IR_Control,
	S_control => S_control,
	A_Control => A_Control,
	ALUop => ALUop,
	B_Control => B_Control,
	InstrBeforeIR => InstrBeforeIR,
	Reg8Bit31_24_WrEn => Reg8Bit31_24_WrEn,
	Reg8Bit23_16_WrEn => Reg8Bit23_16_WrEn,
	Reg8Bit15_8_WrEn => Reg8Bit15_8_WrEn,
	AddByte_Fill => AddByte_Fill,
	AddByte_Empty =>AddByte_Empty,
	MemtoBctr => MemtoBctr,
	packByte7_0_WrEn => packByte7_0_WrEn,		  
	packByte15_8_WrEn => packByte15_8_WrEn,
	packByte23_16_WrEn => packByte23_16_WrEn,
	MEM_DataINSel => MEM_DataINSel,
	Addrsel => Addrsel,
	ASBtoMEMaddr => ASBtoMEMaddr);
	
ALU_Control0 : ALU_Control
port map(
	func => Instr(3 downto 0),
	ALUop => ALUop,
	ALUctr => ALUctr);
	
Immed_Control0 : Immed_Control
port map(
	Op => Instr(31 downto 26),
	IMMEDctr => IMMEDctr);
		
MemOutContolUnit0 : MemOutContolUnit
port map(
	Instr => Instr,
	sizeControl => sizeControl,
	MemOutSel => MemOutSel);
	
beqRM_MuxCtr0 : beqRM_MuxCtr
port map(
	Instr => Instr,
	ALU_in0ctr => ALU_in0ctr,
	MEMAddrCtr => MEMAddrCtr,
	PCAdderCtr => PCAdderCtr);

end Behavioral;

