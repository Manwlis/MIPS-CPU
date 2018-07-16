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
           Reset : in  STD_LOGIC;
			  IFControl : in STD_LOGIC;
			  ALURegsControl : in STD_LOGIC;
			  forwardCtrA : in  STD_LOGIC_VECTOR (1 downto 0);
			  forwardCtrB : in STD_LOGIC_VECTOR (1 downto 0);
			  Read_Reg1 : out  STD_LOGIC_VECTOR (4 downto 0);
           Read_Reg2 : out  STD_LOGIC_VECTOR (4 downto 0);
           WriteRegCache : out  STD_LOGIC_VECTOR (4 downto 0);
           WriteReg : out  STD_LOGIC_VECTOR (4 downto 0);
			  InstrOut : out STD_LOGIC_VECTOR (31 downto 0);
			  WriteRegALU : out  STD_LOGIC_VECTOR (4 downto 0);
			  killCommandExc : out STD_LOGIC;
			  hit : out STD_LOGIC;
				hitOut : out STD_LOGIC);
end Datapath;

architecture Behavioral of Datapath is

COMPONENT IFSTAGE 
Port ( 
	PC_immed : in  STD_LOGIC_VECTOR (31 downto 0);
	PC_sel : in  STD_LOGIC_VECTOR (1 downto 0);
	PC_LdEn : in  STD_LOGIC;
	PC_EPCmuxCtr : in  STD_LOGIC;
	EPC : in STD_LOGIC_VECTOR (31 downto 0);
	Reset : in  STD_LOGIC;
	Clk : in  STD_LOGIC;
	PC : out  STD_LOGIC_VECTOR (31 downto 0);
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
	ALU_out : inout  STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;

COMPONENT Cache
port (
	clk : in std_logic;
	index : in std_logic_vector(4 downto 0);
	dout : out std_logic_vector(131 downto 0));
END COMPONENT;

COMPONENT hitFinder
Port 
	(TagInstr : in  STD_LOGIC_VECTOR (2 downto 0);
	Tag : in  STD_LOGIC_VECTOR (2 downto 0);
	Valid : in  STD_LOGIC;
	Instr : in  STD_LOGIC_VECTOR (5 downto 0);
	hit : out  STD_LOGIC;
	hitOut : out STD_LOGIC);
end COMPONENT;

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

COMPONENT exceptionHandler 
Port (
	PCbeforeIMEM : in STD_LOGIC_VECTOR (31 downto 0);
	Clk : in  STD_LOGIC;
	Reset : in  STD_LOGIC;	
	Instr :in STD_LOGIC_VECTOR (31 downto 0);
	PC  : in  STD_LOGIC_VECTOR (31 downto 0);	
	address  : in  STD_LOGIC_VECTOR (31 downto 0);	
	killCommandExc : out STD_LOGIC;	
	PC_sel : out STD_LOGIC_VECTOR (1 downto 0);
	EPC : inout STD_LOGIC_VECTOR (31 downto 0);
	PC_EPCmuxCtr : out STD_LOGIC);
END COMPONENT;

COMPONENT Adder 
Port ( 
	input0 : in  STD_LOGIC_VECTOR (31 downto 0);
	input1 : in  STD_LOGIC_VECTOR (31 downto 0);
	output : out  STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;

COMPONENT Reg8Bit
    Port ( Clk : in  STD_LOGIC;
           Din : in  STD_LOGIC_VECTOR (7 downto 0);
           WrEn : in  STD_LOGIC;
           Dout : inout  STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;

COMPONENT Reg128BitR 
    Port ( Clk : in  STD_LOGIC;
           WrEn : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Din : in  STD_LOGIC_VECTOR (127 downto 0);
           Dout : inout  STD_LOGIC_VECTOR (127 downto 0));
end COMPONENT;

Signal Instr, Instruction, RF_A, RF_B, A, B, immed_ALU, immediate, ALU_out, MEM_out,wa,InstructionFinal,
Smem, W_mem, S_ALU, W_ALU, Wdec, ALU_inA, ALU_inB, InstrStall, Scache, W_cache,
PCbeforeIMEM, EPC, PCbeforeIR, PCtoEPC, address, Word : STD_LOGIC_VECTOR (31 downto 0);
signal PC_sel : STD_LOGIC_VECTOR (1 downto 0);
signal instrALU, instrMEM : STD_LOGIC_VECTOR (7 downto 0);
signal IFControlDelayed, PC_EPCmuxCtr : STD_LOGIC;
signal Data : STD_LOGIC_VECTOR (127 downto 0);
signal cacheOut : STD_LOGIC_VECTOR (131 downto 0);

begin

WriteRegCache <= W_cache(4 downto 0);
WriteReg <= wa(4 downto 0);


IFSTAGE0:IFSTAGE
port map(
	PC_immed => "00000000000000000000000000000000",
	PC_sel => PC_sel,
   PC_LdEn => IFControl,
	PC_EPCmuxCtr => PC_EPCmuxCtr,
	EPC => EPC,
   Reset => Reset,
	Clk => Clk,
	PC => PCbeforeIMEM,
	Instr => Instr);
	
EPC_firstDelay:Reg32BitR	
port map(
	Clk => Clk,
	WrEn => '1',
	Reset => '0',
	Din => PCbeforeIMEM,
	Dout => PCbeforeIR); 
	
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

EPC_secondDelay :Reg32BitR	
port map(
	Clk => Clk,
	WrEn => '1',
	Reset => '0',
	Din => PCbeforeIR,
	Dout => PCtoEPC); 
	
exceptionHandler0 : exceptionHandler
port map(
	PCbeforeIMEM => PCbeforeIMEM,
	Clk => Clk,
	Reset => Reset,
	Instr => Instruction,
	PC => PCtoEPC,
	killCommandExc => killCommandExc,
	PC_sel => PC_sel,
	EPC => EPC,
	PC_EPCmuxCtr => PC_EPCmuxCtr,
	address => address);

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
	
Adder0: Adder
port map(
	input0 => immediate,
	input1 => RF_A,
	output => address);
	
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
	
Instr_DecodeR:Reg8Bit
Port map (
	Clk => Clk,
	Din => Instruction(31 downto 24), --Xreiazomaste ta 31-26 alla pairnoume ta 8 gia na tairiazei me thn eisodo tou kataxorith.
	WrEn => '1',
	Dout => instrALU);
	
ALUinAforward : mux4to1_32Bit
port map(
 A => A,
 B => Scache,
 C => ALU_out,
 D => MEM_out,
 sel => forwardCtrA,
 output => ALU_inA);
 
ALUinBforward : mux4to1_32Bit
port map(
 A => B,
 B => Scache,
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
	ALU_out => S_ALU);
	
S_ALUR:Reg32BitR	
port map(
	Clk => Clk,
	WrEn => ALURegsControl,
	Reset => '0',
	Din => S_ALU,
	Dout => Scache);	

W_ALUR:Reg32BitR	
port map(
	Clk => Clk,
	WrEn => ALURegsControl,---------
	Reset => '0',
	Din => W_ALU,
	Dout => W_cache);

Instr_ALUR:Reg8Bit
Port map (
	Clk => Clk,
	Din => instrALU, --Xreiazomaste ta 31-26 alla pairnoume ta 8 gia na tairiazei me thn eisodo tou kataxorith.
	WrEn => '1',
	Dout => instrMEM);

Cache0:Cache
port map(
	clk => Clk,
	index => S_ALU(6 downto 2),
	dout => cacheOut);
	
hitFinder0:hitFinder
Port map	(
	TagInstr => Scache (9 downto 7),
	Tag => cacheOut(130 downto 128),
	Valid => cacheOut(131),
	Instr => instrMEM(7 downto 2),
	hit => hit,
	hitOut => hitOut);


DataReg: Reg128BitR 
Port map( 
	Clk => Clk,
	WrEn => '1',
	Reset => '0',
	Din => cacheOut(127 downto 0),
	Dout => Data);

S_CacheR:Reg32BitR	
port map(
	Clk => Clk,
	WrEn => '1',
	Reset => '0',
	Din => Scache,
	Dout => Smem);	

W_CacheR:Reg32BitR	
port map(
	Clk => Clk,
	WrEn => '1',---------
	Reset => '0',
	Din => W_cache,
	Dout => W_mem);

dataWord_mux : mux4to1_32Bit
port map(
 A => Data(31 downto 0),
 B => Data(63 downto 32),
 C => Data(95 downto 64),
 D => Data(127 downto 96),
 sel => Smem(1 downto 0),--word offset
 output => Word);
 
Word_memR:Reg32BitR	
port map(
	Clk => Clk,
	WrEn => '1',---------
	Reset => '0',
	Din => Word,
	Dout => MEM_out);


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
