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
           WriteRegMEM : out  STD_LOGIC_VECTOR (4 downto 0);
           WriteReg : out  STD_LOGIC_VECTOR (4 downto 0);
			  InstrOut : out STD_LOGIC_VECTOR (31 downto 0);
			  WriteRegALU : out  STD_LOGIC_VECTOR (4 downto 0));
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
	Zf_Se_Control: in STD_LOGIC;
	WriteReg : in STD_LOGIC_VECTOR (4 downto 0);	
	Ard1 : out STD_LOGIC_VECTOR (4 downto 0);
	Ard2 : out STD_LOGIC_VECTOR (4 downto 0));--diko mas
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

COMPONENT mux4to1_32Bit
PORT(
 A : IN  std_logic_vector(31 downto 0);
 B : IN  std_logic_vector(31 downto 0);
 C : IN  std_logic_vector(31 downto 0);
 D : IN  std_logic_vector(31 downto 0);
 sel : IN  std_logic_vector(1 downto 0);
 output : OUT  std_logic_vector(31 downto 0));
END COMPONENT;

COMPONENT Reg1BitR
port
(Clk,WrEn,Din,Reset : in std_logic;
 Dout : inout std_logic);
END COMPONENT;

Signal Instr, Instruction, RF_A, RF_B, A, B, immed_ALU, immediate, ALU_out, MEM_out,wa,InstructionFinal,
Smem, memIn, W_mem, bin0, bin1, mem_dataIn, S_ALU, W_ALU, Wdec, Mout, ALU_inA, ALU_inB, InstrStall : STD_LOGIC_VECTOR (31 downto 0);
signal IFControlDelayed : STD_LOGIC;
begin

WriteRegMEM <= W_mem(4 downto 0);
WriteReg <= wa(4 downto 0);


IFSTAGE0:IFSTAGE
port map(
	PC_immed => "00000000000000000000000000000000",
	PC_sel => '0',
   PC_LdEn => IFControl,
   Reset => Reset,
	Clk => Clk,
	Instr => Instr);
	
IFControlDelayReg:Reg1BitR
port map(
  Clk => Clk,
  WrEn => '1',
  Reset => '0',
  Din => IFControl,
  Dout => IFControlDelayed);	
  
InstrRegStall:Reg32BitR	
port map(
	Clk => Clk,
	WrEn => '1',
	Reset => '0',
	Din => Instr,
	Dout => InstrStall); 
	
instrMux : mux32Bit
port map(
	sel => IFControlDelayed, 
	A => InstrStall,
	B => Instr,
	Outt => InstructionFinal);		

IRegister:Reg32BitR	
port map(
	Clk => Clk,
	WrEn => IFControl,
	Reset => '0',
	Din => InstructionFinal,
	Dout => Instruction);
	
InstrOut <= Instruction;
	
DECODE0:DECODE
port map(
	Instr => Instruction,
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
	Zf_Se_Control => Zf_Se_Control,
	WriteReg => wa(4 downto 0),
	Ard1 => Read_Reg1,
	Ard2 => Read_Reg2);
	
A_DecodeR:Reg32BitR	
port map(
	Clk => Clk,
	WrEn => '1',
	Reset => '0',
	Din => RF_A,
	Dout => A);	
	
B_DecodeR:Reg32BitR	
port map(
	Clk => Clk,
	WrEn => '1',
	Reset => '0',
	Din => RF_B,
	Dout => B);
	
Immed_DecodeR:Reg32BitR	
port map(
	Clk => Clk,
	WrEn => '1',------------
	Reset => '0',
	Din => immediate,
	Dout => immed_ALU);	
	
Wdec <= "000000000000000000000000000" & Instruction(20 downto 16);	
	
W_DecodeR:Reg32BitR	
port map(
	Clk => Clk,
	WrEn => '1',-------------
	Reset => '0',
	Din => Wdec,
	Dout => W_ALU);
	
	WriteRegALU <= W_ALU(4 downto 0);
	
ALUinAforward : mux4to1_32Bit
port map(
 A => A,
 B => Smem,
 C => ALU_out,
 D => MEM_out,
 sel => forwardCtrA,
 output => ALU_inA);
 
ALUinBforward : mux4to1_32Bit
port map(
 A => B,
 B => Smem,
 C => ALU_out,
 D => MEM_out,
 sel => forwardCtrB,
 output => ALU_inB);
		
ALUSTAGE0:ALUSTAGE
port map(
	RF_A => ALU_inA,
	RF_B => ALU_inB,
	Immed => immed_ALU,
	ALU_Bin_sel =>ALU_Bin_sel, 
	ALU_func => ALU_func, 
	ALU_out => S_ALU, 
	Zero => Zero);
	
S_ALUR:Reg32BitR	
port map(
	Clk => Clk,
	WrEn => ALURegsControl,
	Reset => '0',
	Din => S_ALU,
	Dout => Smem);	
	
B_ALUR:Reg32BitR	
port map(
	Clk => Clk,
	WrEn => ALURegsControl,
	Reset => '0',
	Din => B,
	Dout => memIn);
	
W_ALUR:Reg32BitR	
port map(
	Clk => Clk,
	WrEn => ALURegsControl,---------
	Reset => '0',
	Din => W_ALU,
	Dout => W_mem);

bin0 <= "000000000000000000000000" & memIn(7 downto 0);
	
byteMux0 : mux32Bit
port map(
	sel => sizeControlMemin, 
	A => memIn,
	B => bin0,
	Outt => mem_dataIn);

Data_MEM0:Data_MEM
port map(
	clk => Clk,
	we => MEM_WrEn,
	addr => Smem(11 downto 2),
	din => mem_dataIn,
	dout => Mout);
	
bin1 <= "000000000000000000000000" & Mout(7 downto 0);
	
byteMux1 : mux32Bit
port map(
	sel => sizeControlMemout, 
	A => Mout,
	B => bin1,
	Outt => MEM_out);		
	
S_memR:Reg32BitR	
port map(
	Clk => Clk,
	WrEn => '1',
	Reset => '0',
	Din => Smem,
	Dout => ALU_out);
	
W_memR:Reg32BitR	
port map(
	Clk => Clk,
	WrEn => '1',-----------
	Reset => '0',
	Din => W_mem,
	Dout => wa);
	

end Behavioral;
