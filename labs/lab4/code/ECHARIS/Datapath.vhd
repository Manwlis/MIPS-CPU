library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Datapath is
    Port ( Clk : in  STD_LOGIC;
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
	        cmov_control : in  STD_LOGIC;
			  Reg8Bit31_24_WrEn  : in  STD_LOGIC;
			  Reg8Bit23_16_WrEn  : in  STD_LOGIC;
			  Reg8Bit15_8_WrEn  : in  STD_LOGIC;
			  AddByte_Fill : in  STD_LOGIC_VECTOR (2 downto 0);
			  MEM_DataINSel : in  STD_LOGIC_VECTOR (2 downto 0);
			  AddByte_Empty : in  STD_LOGIC;
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
			  InstrBeforeIR : out STD_LOGIC_VECTOR (31 downto 0));
end Datapath;

architecture Behavioral of Datapath is

COMPONENT IFSTAGE 
Port ( 
	PC_immed : in  STD_LOGIC_VECTOR (31 downto 0);
	PC_sel : in  STD_LOGIC;
	PC_LdEn : in  STD_LOGIC;
	Reset : in  STD_LOGIC;
	Clk : in  STD_LOGIC;
	Instr : out  STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;

COMPONENT DECODE 
Port ( 
	Instr : in  STD_LOGIC_VECTOR (31 downto 0);
	RF_WrEn : in  STD_LOGIC;
	ALU_out : in  STD_LOGIC_VECTOR (31 downto 0);
	MEM_out : in  STD_LOGIC_VECTOR (31 downto 0);
	RF_WrData_sel : in  STD_LOGIC;
	RF_B_sel : in  STD_LOGIC;
	Clk : in  STD_LOGIC;
	Immed : out  STD_LOGIC_VECTOR (31 downto 0);
	RF_A : out  STD_LOGIC_VECTOR (31 downto 0);
	RF_B : out  STD_LOGIC_VECTOR (31 downto 0);
	Sl_Control : in STD_LOGIC;--diko mas
	Zf_Se_Control: in STD_LOGIC);--diko mas
END COMPONENT;

COMPONENT flipflop
port
(CLK,RST,d: in std_logic;
 q : out std_logic);
END COMPONENT;

COMPONENT ALUSTAGE 
Port ( 
	RF_A : in  STD_LOGIC_VECTOR (31 downto 0);
	RF_B : in  STD_LOGIC_VECTOR (31 downto 0);
	Immed : in  STD_LOGIC_VECTOR (31 downto 0);
	ALU_Bin_sel : in  STD_LOGIC;
	ALU_func : in  STD_LOGIC_VECTOR (3 downto 0);
	ALU_out : inout  STD_LOGIC_VECTOR (31 downto 0);
	Zero : inout STD_LOGIC);
END COMPONENT;

COMPONENT Data_MEM is
port (
	clk : in std_logic;
	we : in std_logic;
	addr : in std_logic_vector(9 downto 0);
	din : in std_logic_vector(31 downto 0);
	dout : out std_logic_vector(31 downto 0));
END COMPONENT;

COMPONENT mux32Bit
port
(sel : in  STD_LOGIC;
 A : in  STD_LOGIC_VECTOR (31 downto 0);
 B : in  STD_LOGIC_VECTOR (31 downto 0);
 Outt : out  STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;

COMPONENT Reg32BitR
Port ( 
	Clk : in  STD_LOGIC;
 WrEn : in  STD_LOGIC;
 Reset : in STD_LOGIC;
 Din : in  STD_LOGIC_VECTOR (31 downto 0); 
 Dout : inout  STD_LOGIC_VECTOR (31 downto 0));	  
END COMPONENT;	

COMPONENT mux8to1_32Bit
PORT(
 in0 : IN  std_logic_vector(31 downto 0);
 in1 : IN  std_logic_vector(31 downto 0);
 in2 : IN  std_logic_vector(31 downto 0);
 in3 : IN  std_logic_vector(31 downto 0);
 in4 : IN  std_logic_vector(31 downto 0);
 in5 : IN  std_logic_vector(31 downto 0);
 in6 : IN  std_logic_vector(31 downto 0);
 in7 : IN  std_logic_vector(31 downto 0);
 sel : IN  std_logic_vector(2 downto 0);
 output : OUT  std_logic_vector(31 downto 0));
END COMPONENT;

COMPONENT Reg8Bit
port
(Clk,WrEn : in std_logic;
 Din : in  STD_LOGIC_VECTOR (7 downto 0);
 Dout : inout std_logic_VECTOR (7 downto 0));
END COMPONENT;


COMPONENT mux4to1_32Bit
PORT(
 A : IN  std_logic_vector(31 downto 0);
 B : IN  std_logic_vector(31 downto 0);
 C : IN  std_logic_vector(31 downto 0);
 D : IN  std_logic_vector(31 downto 0);
 sel : IN  std_logic_vector(1 downto 0);
 output : OUT  std_logic_vector(31 downto 0));
END COMPONENT;

COMPONENT Incrementor
Port ( 
	input : in  STD_LOGIC_VECTOR (31 downto 0);
	output : out  STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;

signal immediate,instru,instruction,RF_A,RF_B,A,B,Sin,ALU_out,MEM_out,mI,Mout,bin0,bin1,ALU_inA,ALU_inB,ALUstage_out,muxAin : std_logic_vector(31 downto 0);
signal muxA_in1,muxA_in2,muxA_in3,muxA_in4,muxB_in1,muxB_in2,muxB_in3,muxB_in4,cmovMux_out,AddByte_Result,Amux,FinalmemInput,
MEMAddr,PCimmed,BRegIn,StoMEM,finalMEMAddr,incrementedMEMaddr,AddrtoIncrementor,packByte,MoutToSizeCtr,memInput1,memInput2,memInput3,memInput4,immedToMemAddr : std_logic_vector(31 downto 0);
signal abc : std_logic_vector(7 downto 0);

begin

Instr <= instruction;

muxBeqRM_IF : mux32Bit
port map(
	sel => PCAdderCtr, 
	A => A,
	B => immediate,
	Outt => PCimmed);

IFSTAGE0:IFSTAGE
port map(
	PC_immed => PCimmed,
	PC_sel => PC_SEL,
   PC_LdEn => PC_LdEn,
   Reset => Reset,
	Clk => Clk,
	Instr => instru);
	
InstrBeforeIR <= instru;
	
IRReg32BitR:Reg32BitR	
port map(
	Clk => Clk,
	WrEn => IR_Control,
	Reset => '0',
	Din => instru,
	Dout => instruction);
	
DECODE0:DECODE
port map(
	Instr => instruction,
	RF_WrEn => RF_WrEn,
	ALU_out => ALU_out,
	MEM_out => MEM_out,
	RF_WrData_sel => RF_WrData_sel,
	RF_B_sel => RF_B_sel,
	Clk => Clk,
	Immed => immediate,
	RF_A => RF_A,
	RF_B => RF_B,
	Sl_Control => Sl_Control,
	Zf_Se_Control => Zf_Se_Control);
	
AReg32BitR:Reg32BitR	
port map(
	Clk => Clk,
	WrEn => A_Control,
	Reset => '0',
	Din => RF_A,
	Dout => A);	
	
muxBin : mux32Bit
port map(
	sel => MemtoBctr, 
	A => RF_B,
	B => MEM_out,
	Outt => BRegIn);

BReg32BitR:Reg32BitR	
port map(
	Clk => Clk,
	WrEn => B_Control,
	Reset => '0',
	Din => BRegIn,
	Dout => B);
	
mux_cmov0 : mux32Bit
port map(
	sel => cmov_control, 
	A => A,
	B => "00000000000000000000000000000000",
	Outt => muxAin);


muxA_in1 <= "000000000000000000000000" & muxAin(31 downto 24);
muxA_in2 <= "000000000000000000000000" & muxAin(23 downto 16);
muxA_in3 <= "000000000000000000000000" & muxAin(15 downto 8);
muxA_in4 <= "000000000000000000000000" & muxAin(7 downto 0);

mux8to1_32BitA : mux8to1_32Bit
port map(
	in0 => muxAin,
	in1 => muxA_in1,
	in2 => muxA_in2,
	in3 => muxA_in3,
	in4 => muxA_in4,
	in5 => "00000000000000000000000000000000",
	in6 => "00000000000000000000000000000000",
	in7 => "00000000000000000000000000000000",
	sel => AddByte_Fill,
	output => Amux);
	
muxB_in1 <= "000000000000000000000000" & B(31 downto 24);
muxB_in2 <= "000000000000000000000000" & B(23 downto 16);
muxB_in3 <= "000000000000000000000000" & B(15 downto 8);
muxB_in4 <= "000000000000000000000000" & B(7 downto 0);

mux8to1_32BitB : mux8to1_32Bit
port map(
	in0 => B,
	in1 => muxB_in1,
	in2 => muxB_in2,
	in3 => muxB_in3,
	in4 => muxB_in4,
	in5 => "00000000000000000000000000000000",
	in6 => "00000000000000000000000000000000",
	in7 => "00000000000000000000000000000000",
	sel => AddByte_Fill,
	output => ALU_inB);
	
	
mux_beqRM_ALU : mux32Bit
port map(
	sel => ALU_in0ctr, 
	A => Mout,
	B => Amux,
	Outt => ALU_inA);
	
ALUSTAGE0:ALUSTAGE
port map(
	RF_A => ALU_inA,
	RF_B => ALU_inB,
	Immed => immediate,
	ALU_Bin_sel =>ALU_Bin_sel, 
	ALU_func => ALU_func, 
	ALU_out => ALUstage_out, 
	Zero => Zero);
		
mux_cmov1 : mux32Bit
port map(
	sel => cmov_control, 
	A => ALUstage_out,
	B => A,
	Outt => cmovMux_out);
	
Reg8Bit31_24:Reg8Bit	
port map(
	Clk => Clk,
	WrEn => Reg8Bit31_24_WrEn,
	Din => cmovMux_out(7 downto 0),
	Dout =>  AddByte_Result(31 downto 24));
	
Reg8Bit23_16:Reg8Bit	
port map(
	Clk => Clk,
	WrEn => Reg8Bit23_16_WrEn,
	Din => cmovMux_out(7 downto 0),
	Dout =>  AddByte_Result(23 downto 16));

Reg8Bit15_8:Reg8Bit	
port map(
	Clk => Clk,
	WrEn => Reg8Bit15_8_WrEn,
	Din => cmovMux_out(7 downto 0),
	Dout => AddByte_Result(15 downto 8));
	
AddByte_Result(7 downto 0) <= cmovMux_out(7 downto 0);
	
muxAddByte : mux32Bit
port map(
	sel => AddByte_Empty, 
	A => cmovMux_out,
	B => AddByte_Result,
	Outt => Sin);

SReg32BitR:Reg32BitR	
port map(
	Clk => Clk,
	WrEn => S_Control,
	Reset => '0',
	Din => Sin,
	Dout => ALU_out);

immedToMemAddr <= immediate(29 downto 0) & "00";
	
mux_beqRM_MEM : mux32Bit
port map(
	sel => MEMAddrCtr, 
	A => ALU_out,
	B => immedToMemAddr,
	Outt => StoMEM);
		
muxMEMin : mux4to1_32Bit
port map(
	sel => ASBtoMEMaddr, 
	A => A,
	B => StoMEM,
	C => B,
	D => "00000000000000000000000000000000",
	output => MEMAddr);
	
finalAddrSelector : mux32Bit
port map(
	sel => Addrsel, 
	A => MEMAddr,
	B => incrementedMEMaddr,
	Outt => finalMEMAddr);	
	
AddrRegister:Reg32BitR	
port map(
	Clk => Clk,
	WrEn => '1',
	Reset => '0',
	Din => finalMEMAddr,
	Dout => AddrtoIncrementor);

Incrementor0 : Incrementor
port map(
	input => AddrtoIncrementor,
	output =>incrementedMEMaddr);
	
	
bin0 <= "000000000000000000000000" & B(7 downto 0);
	
mux0 : mux32Bit
port map(
	sel => sizeControl, 
	A => B,
	B => bin0,
	Outt => mI);
	
memInput1 <= mI(7) &  mI(7) &  mI(7) &  mI(7) &  mI(7) &  mI(7) &  mI(7) &  mI(7) &  mI(7) &  mI(7) &  mI(7) &  mI(7)
           & mI(7) &  mI(7) &  mI(7) &  mI(7) &  mI(7) &  mI(7) &  mI(7) &  mI(7) &  mI(7) &  mI(7) &  mI(7) &  mI(7) & mI(7 downto 0);	
			  
memInput2 <= mI(15) &  mI(15) &  mI(15) &  mI(15) &  mI(15) &  mI(15) &  mI(15) &  mI(15) &  mI(15) &  mI(15) &  mI(15) &  mI(15)
           & mI(15) &  mI(15) &  mI(15) &  mI(15) &  mI(15) &  mI(15) &  mI(15) &  mI(15) &  mI(15) &  mI(15) &  mI(15) &  mI(15) & mI(15 downto 8);	
			  
memInput3 <= mI(23) &  mI(23) &  mI(23) &  mI(23) &  mI(23) &  mI(23) &  mI(23) &  mI(23) &  mI(23) &  mI(23) &  mI(23) &  mI(23)
           & mI(23) &  mI(23) &  mI(23) &  mI(23) &  mI(23) &  mI(23) &  mI(23) &  mI(23) &  mI(23) &  mI(23) &  mI(23) &  mI(23) & mI(23 downto 16);
			  
memInput4 <= mI(31) &  mI(31) &  mI(31) &  mI(31) &  mI(31) &  mI(31) &  mI(31) &  mI(31) &  mI(31) &  mI(31) &  mI(31) &  mI(31)
           & mI(31) &  mI(31) &  mI(31) &  mI(31) &  mI(31) &  mI(31) &  mI(31) &  mI(31) &  mI(31) &  mI(31) &  mI(31) &  mI(31) & mI(31 downto 24);		
	
muxMEMDataIn : mux8to1_32Bit
port map(
	in0 => mI,
	in1 => memInput1,
	in2 => memInput2,
	in3 => memInput3,
	in4 => memInput4,
	in5 => "00000000000000000000000000000000",
	in6 => "00000000000000000000000000000000",
	in7 => "00000000000000000000000000000000",
	sel => MEM_DataINSel,
	output => FinalmemInput);


Data_MEM0:Data_MEM
port map(
	clk => Clk,
	we => MEM_WrEn,
	addr => finalMEMAddr(11 downto 2),
	din => FinalmemInput,
	dout => Mout);
		
packReg7_0:Reg8Bit	
port map(
	Clk => Clk,
	WrEn => packByte7_0_WrEn,
	Din => Mout(7 downto 0),
	Dout =>  packByte(7 downto 0));
	
packReg15_8:Reg8Bit	
port map(
	Clk => Clk,
	WrEn => packByte15_8_WrEn,
	Din => Mout(7 downto 0),
	Dout =>  packByte(15 downto 8));

packReg23_16:Reg8Bit	
port map(
	Clk => Clk,
	WrEn => packByte23_16_WrEn,
	Din => Mout(7 downto 0),
	Dout => packByte(23 downto 16));
	
	abc <= Mout(7 downto 0);
packByte(31 downto 24) <= abc;
--Mout(7 downto 0);
	
MoutSelector : mux32Bit
port map(
	sel => MemOutSel, 
	A => Mout,
	B => packByte,
	Outt => MoutToSizeCtr);

	
bin1 <= "000000000000000000000000" & MoutToSizeCtr(7 downto 0);
	
mux1 : mux32Bit
port map(
	sel => sizeControl, 
	A => MoutToSizeCtr,
	B => bin1,
	Outt => MEM_out);


end Behavioral;
