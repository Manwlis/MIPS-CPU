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
	cmov_control : out  STD_LOGIC;
	Reg8Bit31_24_WrEn  : out STD_LOGIC;
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
	cmov_control : in  STD_LOGIC;
	Reg8Bit31_24_WrEn  : in  STD_LOGIC;
	Reg8Bit23_16_WrEn  : in  STD_LOGIC;
	Reg8Bit15_8_WrEn  : in  STD_LOGIC;
	AddByte_Fill : in  STD_LOGIC_VECTOR (2 downto 0);
	AddByte_Empty : in  STD_LOGIC;
	IR_Control : in  STD_LOGIC;
	A_Control : in  STD_LOGIC;
	B_Control : in  STD_LOGIC;
	S_Control : in  STD_LOGIC;
   ALU_in0ctr : in  STD_LOGIC;
   MEMAddrCtr : in  STD_LOGIC;
   PCAdderCtr : in  STD_LOGIC;
	MemtoBctr : in  STD_LOGIC;
	packByte7_0_WrEn  : in  STD_LOGIC;			  
	packByte15_8_WrEn  : in  STD_LOGIC;	
	packByte23_16_WrEn  : in  STD_LOGIC;
	Addrsel : in  STD_LOGIC;
	MemOutSel : in  STD_LOGIC;
	ASBtoMEMaddr : in  STD_LOGIC_VECTOR (1 downto 0);
	MEM_DataINSel : in  STD_LOGIC_VECTOR (2 downto 0);
	InstrBeforeIR : out STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;

signal Instr,InstrBeforeIR : STD_LOGIC_VECTOR (31 downto 0);
signal Zero, RF_B_sel, RF_WrData_sel, RF_WrEn, ALU_Bin_sel, MEM_WrEn, PC_SEL, PC_LdEn, sizeControl, IR_Control, S_control, A_Control, B_Control,
cmov_control,Reg8Bit31_24_WrEn,Reg8Bit23_16_WrEn,Reg8Bit15_8_WrEn,AddByte_Empty, ALU_in0ctr,
 MEMAddrCtr, PCAdderCtr, MemtoBctr, packByte7_0_WrEn, packByte15_8_WrEn, packByte23_16_WrEn, Addrsel, MemOutSel:STD_LOGIC;
signal ALUctr : STD_LOGIC_VECTOR (3 downto 0);
signal IMMEDctr, ASBtoMEMaddr : STD_LOGIC_VECTOR (1 downto 0);
signal AddByte_Fill,MEM_DataINSel : STD_LOGIC_VECTOR (2 downto 0);

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
		cmov_control => cmov_control,
		Reg8Bit31_24_WrEn => Reg8Bit31_24_WrEn,
		Reg8Bit23_16_WrEn => Reg8Bit23_16_WrEn,
		Reg8Bit15_8_WrEn => Reg8Bit15_8_WrEn,
		AddByte_Fill => AddByte_Fill,
		AddByte_Empty => AddByte_Empty,
		ALUctr => ALUctr,
		IMMEDctr => IMMEDctr,
		ALU_in0ctr => ALU_in0ctr,
		MEMAddrCtr => MEMAddrCtr,
		PCAdderCtr => PCAdderCtr,
		MemtoBctr => MemtoBctr,
		packByte7_0_WrEn => packByte7_0_WrEn,		  
		packByte15_8_WrEn => packByte15_8_WrEn,
		packByte23_16_WrEn => packByte23_16_WrEn,
		Addrsel => Addrsel,
		MemOutSel => MemOutSel,
		ASBtoMEMaddr => ASBtoMEMaddr,
		MEM_DataINSel => MEM_DataINSel,
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
		cmov_control => cmov_control,
		Reg8Bit31_24_WrEn => Reg8Bit31_24_WrEn,
		Reg8Bit23_16_WrEn => Reg8Bit23_16_WrEn,
		Reg8Bit15_8_WrEn => Reg8Bit15_8_WrEn,
		AddByte_Fill => AddByte_Fill,
		AddByte_Empty =>AddByte_Empty,
		IR_Control => IR_Control,
		A_Control => A_Control,
		B_Control => B_Control,
		S_Control => S_Control,
		ALU_in0ctr => ALU_in0ctr,
		MEMAddrCtr => MEMAddrCtr,
		PCAdderCtr => PCAdderCtr,
		MemtoBctr => MemtoBctr,
		packByte7_0_WrEn => packByte7_0_WrEn,		  
		packByte15_8_WrEn => packByte15_8_WrEn,
		packByte23_16_WrEn => packByte23_16_WrEn,
		Addrsel => Addrsel,
		MemOutSel => MemOutSel,
		ASBtoMEMaddr => ASBtoMEMaddr,
		MEM_DataINSel => MEM_DataINSel,
		InstrBeforeIR => InstrBeforeIR);
			
end Structural;

