
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PipelinedProcessor is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Instruction : out  STD_LOGIC_VECTOR (31 downto 0));
end PipelinedProcessor;

architecture Behavioral of PipelinedProcessor is

COMPONENT Datapath 
Port ( Clk : in  STD_LOGIC;
		Sl_Control : in  STD_LOGIC;
		Zf_Se_Control : in  STD_LOGIC;
		RF_B_sel : in  STD_LOGIC;
		RF_WrData_sel : in  STD_LOGIC;
		RF_WrEn : in  STD_LOGIC;
		ALU_Bin_sel : in  STD_LOGIC;
		ALU_func : in  STD_LOGIC_VECTOR (3 downto 0);
		MEM_WrEn : in  STD_LOGIC;
		Reset : in  STD_LOGIC;
		sizeControlMemin : in  STD_LOGIC;
		sizeControlMemout : in  STD_LOGIC;
		Zero : inout STD_LOGIC;
	  IFControl : in STD_LOGIC;
	  ALURegsControl : in STD_LOGIC;
		forwardCtrA : in  STD_LOGIC_VECTOR (1 downto 0);
		forwardCtrB : in STD_LOGIC_VECTOR (1 downto 0);
		Read_Reg1 : out  STD_LOGIC_VECTOR (4 downto 0);
		Read_Reg2 : out  STD_LOGIC_VECTOR (4 downto 0);
		WriteRegALU : out STD_LOGIC_VECTOR (4 downto 0);
		WriteRegMEM : out  STD_LOGIC_VECTOR (4 downto 0);
		WriteReg : out  STD_LOGIC_VECTOR (4 downto 0);
		InstrOut : out STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;

COMPONENT Control 
Port(
	Clk : in  STD_LOGIC;
	Instr : in  STD_LOGIC_VECTOR (31 downto 0);
	Zero : in  STD_LOGIC;
	Sl_Control : out  STD_LOGIC;
	Zf_Se_Control : out  STD_LOGIC;
	RF_B_sel : out STD_LOGIC;
	RF_WrData_sel : inout  STD_LOGIC;
	RF_WrEn : inout STD_LOGIC;
	ALU_Bin_sel : inout  STD_LOGIC;
	ALU_func : inout STD_LOGIC_VECTOR (3 downto 0);
	MEM_WrEn : inout  STD_LOGIC;
	sizeControlMEMin : inout std_logic;
	sizeControlMEMout : inout std_logic;
	RF_WrEn_ALU : out  STD_LOGIC;
   killCommand : in  STD_LOGIC;
	RF_WrEn_MEM : out  STD_LOGIC);
END COMPONENT;

COMPONENT Reg32BitR
Port ( 
	Clk : in  STD_LOGIC;
 WrEn : in  STD_LOGIC;
 Reset : in STD_LOGIC;
 Din : in  STD_LOGIC_VECTOR (31 downto 0); 
 Dout : inout  STD_LOGIC_VECTOR (31 downto 0));	  
END COMPONENT;	

COMPONENT Forwarding_Unit
    Port ( Read_Reg1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Read_Reg2 : in  STD_LOGIC_VECTOR (4 downto 0);
           RF_WrEn_ALU : in  STD_LOGIC;
           WriteRegMEM : in  STD_LOGIC_VECTOR (4 downto 0);
           RF_WrEn_MEM : in  STD_LOGIC;
           Stall_Forward : in  STD_LOGIC_VECTOR (1 downto 0);
           WriteReg : in  STD_LOGIC_VECTOR (4 downto 0);
           forwardCtrA : out  STD_LOGIC_VECTOR (1 downto 0);
           forwardCtrB : out  STD_LOGIC_VECTOR (1 downto 0));
END COMPONENT;
			  
COMPONENT Stall_Unit
    Port ( Opcode : in  STD_LOGIC_VECTOR (5 downto 0);
           WriteRegALU : in  STD_LOGIC_VECTOR (4 downto 0);
           Read_Reg1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Read_Reg2 : in  STD_LOGIC_VECTOR (4 downto 0);
           IFControl : out  STD_LOGIC;
           killCommand : out  STD_LOGIC;
           Stall_Forward : out  STD_LOGIC_VECTOR (1 downto 0));
END COMPONENT;

COMPONENT Reg4BitR
port
(Clk,WrEn,Reset : in std_logic;
 Din : in  STD_LOGIC_VECTOR (3 downto 0);
 Dout : inout std_logic_VECTOR (3 downto 0)); 
END COMPONENT;

signal Sl_Control, Zf_Se_Control, RF_B_sel, RF_WrData_sel, RF_WrEn, ALU_Bin_sel, MEM_WrEn, IFControl,
 sizeControl, Zero, sizeControlMEMin, sizeControlMEMout,ALURegsControl, killCommand,-------------
RF_WrEn_ALU, RF_WrEn_MEM : std_logic;
signal ALU_func,Stall_ForwardExtended,Stall_ForwardDelayed, Stall_ForwardDelayedHalf : STD_LOGIC_VECTOR (3 downto 0);
signal InstrOut ,readReg1Extended, readReg2Extended, Read_Reg1Out, Read_Reg2Out, OpcodeExtended, Opcode : STD_LOGIC_VECTOR (31 downto 0);
signal forwardCtrA, forwardCtrB, Stall_Forward  : STD_LOGIC_VECTOR (1 downto 0);
signal Read_Reg1, Read_Reg2, WriteRegALU, WriteRegMEM, WriteReg : STD_LOGIC_VECTOR (4 downto 0);

begin 

Datapath0 : Datapath
Port map(Clk => Clk,
	  Sl_Control => Sl_Control,
	  Zf_Se_Control => Zf_Se_Control,
	  RF_B_sel => RF_B_sel,
	  RF_WrData_sel => RF_WrData_sel, 
	  RF_WrEn => RF_WrEn,
	  ALU_Bin_sel => ALU_Bin_sel,
	  ALU_func => ALU_func,
	  MEM_WrEn => MEM_WrEn,
	  Reset => Reset,
	  sizeControlMemin => sizeControlMEMin,
	  sizeControlMemout => sizeControlMEMout,
	  Zero => Zero,
	  IFControl => IFControl,
	  ALURegsControl => ALURegsControl,
	  InstrOut => InstrOut,
     forwardCtrA => forwardCtrA,
     forwardCtrB => forwardCtrB,
	  Read_Reg1 => Read_Reg1,
	  Read_Reg2 => Read_Reg2,
	  WriteRegMEM => WriteRegMEM,
	  WriteReg => WriteReg,
	  WriteRegALU => WriteRegALU);
	
ALURegsControl<='1';
	
Instruction <= InstrOut;
	  
Control0 : Control
Port map(	Clk => Clk,
		Instr => InstrOut,
		Zero => Zero,
		Sl_Control => Sl_Control,
		Zf_Se_Control => Zf_Se_Control,
		RF_B_sel => RF_B_sel,
		RF_WrData_sel => RF_WrData_sel,
		RF_WrEn => RF_WrEn,
		ALU_Bin_sel => ALU_Bin_sel,
		ALU_func => ALU_func,
		MEM_WrEn => MEM_WrEn,
		sizeControlMEMin => sizeControlMEMin,
		sizeControlMEMout => sizeControlMEMout,
		RF_WrEn_ALU => RF_WrEn_ALU,
	killCommand => killCommand,
		RF_WrEn_MEM => RF_WrEn_MEM);
		
		
readReg1Extended <= "000000000000000000000000000" & Read_Reg1;

ArdReg0:Reg32BitR	
port map(
	Clk => Clk,
	WrEn => '1',
	Reset => '0',
	Din => readReg1Extended,
	Dout => Read_Reg1Out);	
			
readReg2Extended <= "000000000000000000000000000" & Read_Reg2;

ArdReg1:Reg32BitR	
port map(
	Clk => Clk,
	WrEn => '1',
	Reset => '0',
	Din => readReg2Extended,
	Dout => Read_Reg2Out);	
	
Forwarding_Unit0 : Forwarding_Unit	
port map(
		forwardCtrA => forwardCtrA,
		forwardCtrB => forwardCtrB,
		Read_Reg1 => Read_Reg1Out(4 downto 0),
		Read_Reg2 => Read_Reg2Out(4 downto 0),
		WriteRegMEM => WriteRegMEM,
		WriteReg => WriteReg,
		Stall_Forward => Stall_ForwardDelayed(1 downto 0),
		RF_WrEn_ALU => RF_WrEn_ALU,
		RF_WrEn_MEM => RF_WrEn_MEM);
		
--Stall

OpcodeExtended <= "00000000000000000000000000" & InstrOut(31 downto 26);

OpcodeReg:Reg32BitR	
port map(
	Clk => Clk,
	WrEn => '1',
	Reset => '0',
	Din => OpcodeExtended,
	Dout => Opcode);
	
Stall_Unit0 : Stall_Unit	
port map(
	Opcode => Opcode(5 downto 0),
	WriteRegALU => WriteRegALU,
	Read_Reg1 => Read_Reg1,
	Read_Reg2 => Read_Reg2,
	IFControl => IFControl,
	killCommand => killCommand,
	Stall_Forward => Stall_Forward);
	
Stall_ForwardExtended<= "00" & Stall_Forward;
	
StallForwardReg0:Reg4BitR
port map(
  Clk => Clk,
  WrEn => '1',
	Reset => '0',
  Din => Stall_ForwardExtended,
  Dout => Stall_ForwardDelayedHalf);

StallForwardReg1:Reg4BitR
port map(
  Clk => Clk,
  WrEn => '1',
	Reset => '0',
  Din => Stall_ForwardDelayedHalf,
  Dout => Stall_ForwardDelayed);
			
end Behavioral;

