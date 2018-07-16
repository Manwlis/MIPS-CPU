library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Control is
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
end Control;



architecture Behavioral of Control is

COMPONENT Table 
Port (
	Instr : in  STD_LOGIC_VECTOR (31 downto 0);
	Zero : in  STD_LOGIC;
	Sl_Control : out  STD_LOGIC;
	Zf_Se_Control : out  STD_LOGIC;
	RF_B_sel : out STD_LOGIC;
	RF_WrData_sel : out  STD_LOGIC;
	RF_WrEn : out STD_LOGIC;
	ALU_Bin_sel : out  STD_LOGIC;
	ALU_func : out STD_LOGIC_VECTOR (3 downto 0);
	MEM_WrEn : out  STD_LOGIC;
	sizeControl : out  STD_LOGIC);
END COMPONENT;

COMPONENT Reg1BitR
port
(Clk,WrEn,Din,Reset : in std_logic;
 Dout : inout std_logic);
END COMPONENT;

COMPONENT Reg4BitR
port
(Clk,WrEn,Reset : in std_logic;
 Din : in  STD_LOGIC_VECTOR (3 downto 0);
 Dout : inout std_logic_VECTOR (3 downto 0)); 
END COMPONENT;

COMPONENT mux
port
(in0,in1,sel: in std_logic;
 output : out std_logic);
END COMPONENT;
	
Signal ALU_funcDecode : STD_LOGIC_VECTOR (3 downto 0);
Signal RF_WrData_selDecode, RF_WrEnDecode, ALU_Bin_selDecode, MEM_WrEnDecode, sizeControlDecode, 
RF_WrData_selALU, RF_WrEnALU, MEM_WrEnALU, sizeControlALU, RF_WrEnTable, MEM_WrEnTable,
RF_WrEnMEM, RF_WrData_selMEM : STD_LOGIC;

begin

Table0: Table
port map(
	Instr => Instr,
	Zero => Zero,
	Sl_Control => Sl_Control,
	Zf_Se_Control => Zf_Se_Control,
	RF_B_sel => RF_B_sel,
	RF_WrData_sel => RF_WrData_selDecode,
	RF_WrEn => RF_WrEnTable,
	ALU_Bin_sel => ALU_Bin_selDecode, 
	ALU_func => ALU_funcDecode,
	MEM_WrEn => MEM_WrEnTable,
	sizeControl => sizeControlDecode	);
	
--decode

RF_WrData_selDecode_reg:Reg1BitR
port map(
	Clk => Clk,
	WrEn => '1',
	Reset => '0',
	Din => RF_WrData_selDecode,
	Dout => RF_WrData_selALU);
  
  
RF_WrEnKill:mux
port map(
   in0 => RF_WrEnTable,
	in1 => '0',
	sel => killCommand,
	output => RF_WrEnDecode);
	
  
RF_WrEnDecode_reg:Reg1BitR
port map(
  Clk => Clk,
  WrEn => '1',
	Reset => '0',
  Din => RF_WrEnDecode,
  Dout => RF_WrEnALU);
  
 ALU_Bin_selDecode_reg:Reg1BitR
port map(
  Clk => Clk,
  WrEn => '1',
	Reset => '0',
  Din => ALU_Bin_selDecode,
  Dout => ALU_Bin_sel);
  
ALU_funcDecodeReg:Reg4BitR
port map(
  Clk => Clk,
  WrEn => '1',
	Reset => '0',
  Din => ALU_funcDecode,
  Dout => ALU_func);
  
    
MEM_WrEnKill:mux
port map(
   in0 => MEM_WrEnTable,
	in1 => '0',
	sel => killCommand,
	output => MEM_WrEnDecode);
	
  
 MEM_WrEnDecodereg:Reg1BitR
port map(
  Clk => Clk,
  WrEn => '1',
	Reset => '0',
  Din => MEM_WrEnDecode,
  Dout => MEM_WrEnALU);
  
sizeControlDecodereg:Reg1BitR
port map(
  Clk => Clk,
  WrEn => '1',
	Reset => '0',
  Din => sizeControlDecode,
  Dout => sizeControlALU);
 
 --ALU
 
RF_WrData_selALU_reg:Reg1BitR
port map(
  Clk => Clk,
  WrEn => '1',
	Reset => '0',
  Din => RF_WrData_selALU,
  Dout => RF_WrData_selMEM);
  
RF_WrEnALU_reg:Reg1BitR
port map(
  Clk => Clk,
  WrEn => '1',
	Reset => '0',
  Din => RF_WrEnALU,
  Dout => RF_WrEnMEM);
  
 RF_WrEn_ALU <= RF_WrEnMEM; --forward Unit RF_WrEnALU
  
MEM_WrEnALUreg:Reg1BitR
port map(
  Clk => Clk,
  WrEn => '1',
	Reset => '0',
  Din => MEM_WrEnALU,
  Dout => MEM_WrEn);
  
sizeControlALUreg:Reg1BitR
port map(
  Clk => Clk,
  WrEn => '1',
	Reset => '0',
  Din => sizeControlALU,
  Dout => sizeControlMEMin);
  
  --mem 
  
RF_WrData_selMEM_reg:Reg1BitR
port map(
  Clk => Clk,
  WrEn => '1',
	Reset => '0',
  Din => RF_WrData_selMEM,
  Dout => RF_WrData_sel);
  
RF_WrEnMEM_reg:Reg1BitR
port map(
  Clk => Clk,
  WrEn => '1',
	Reset => '0',
  Din => RF_WrEnMEM,
  Dout => RF_WrEn);

RF_WrEn_MEM <= RF_WrEn; --forward Unit RF_WrEnMEM
 
sizeControlMEMreg:Reg1BitR
port map(
  Clk => Clk,
  WrEn => '1',
	Reset => '0',
  Din => sizeControlMEMin,
  Dout => sizeControlMEMout);
end Behavioral;

