library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Control is
Port(
	Clk : in  STD_LOGIC;
	Instr : in  STD_LOGIC_VECTOR (31 downto 0);
	Sl_Control : out  STD_LOGIC;
	Zf_Se_Control : out  STD_LOGIC;
	RF_B_sel : out STD_LOGIC;
	RF_WrData_sel : inout  STD_LOGIC;
	RF_WrEn : inout STD_LOGIC;
	ALU_Bin_sel : inout  STD_LOGIC;
	ALU_func : inout STD_LOGIC_VECTOR (3 downto 0);
	RF_WrEn_ALU : out  STD_LOGIC;
   killCommand : in  STD_LOGIC;
	RF_WrEn_MEM : out  STD_LOGIC;
	hit : in STD_LOGIC);
end Control;



architecture Behavioral of Control is

COMPONENT Table 
Port (
	Instr : in  STD_LOGIC_VECTOR (31 downto 0);
	Sl_Control : out  STD_LOGIC;
	Zf_Se_Control : out  STD_LOGIC;
	RF_B_sel : out STD_LOGIC;
	RF_WrData_sel : out  STD_LOGIC;
	RF_WrEn : out STD_LOGIC;
	ALU_Bin_sel : out  STD_LOGIC;
	ALU_func : out STD_LOGIC_VECTOR (3 downto 0));
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
Signal RF_WrData_selDecode, RF_WrEnDecode, ALU_Bin_selDecode, RF_WrData_selALU, RF_WrEnALU, RF_WrEnTable, RF_WrEnMEM, RF_WrData_selMEM, 
RF_WrData_selCache, RF_WrEnCache, RF_WrEnCacheFinal : STD_LOGIC;

begin

Table0: Table
port map(
	Instr => Instr,
	Sl_Control => Sl_Control,
	Zf_Se_Control => Zf_Se_Control,
	RF_B_sel => RF_B_sel,
	RF_WrData_sel => RF_WrData_selDecode,
	RF_WrEn => RF_WrEnTable,
	ALU_Bin_sel => ALU_Bin_selDecode, 
	ALU_func => ALU_funcDecode);
	
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
  
 --ALU
 
RF_WrData_selALU_reg:Reg1BitR
port map(
  Clk => Clk,
  WrEn => '1',
	Reset => '0',
  Din => RF_WrData_selALU,
  Dout => RF_WrData_selCache);
  
RF_WrEnALU_reg:Reg1BitR
port map(
  Clk => Clk,
  WrEn => '1',
	Reset => '0',
  Din => RF_WrEnALU,
  Dout => RF_WrEnCache);
  
 RF_WrEn_ALU <= RF_WrEnCache; --forward Unit RF_WrEnALU
  
  --cache
  
  RF_WrData_selCache_reg:Reg1BitR
port map(
  Clk => Clk,
  WrEn => '1',
	Reset => '0',
  Din => RF_WrData_selCache,
  Dout => RF_WrData_selMEM);
  
  
RF_WrEnCacheFinal <=  RF_WrEnCache and hit;
  
RF_WrEnCache_reg:Reg1BitR
port map(
  Clk => Clk,
  WrEn => '1',
	Reset => '0',
  Din => RF_WrEnCacheFinal,
  Dout => RF_WrEnMEM);
  
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

end Behavioral;

