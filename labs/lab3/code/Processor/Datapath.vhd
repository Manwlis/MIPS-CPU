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


signal immediate,instru,instruction,RF_A,RF_B,A,B,S,ALU_out,MEM_out,memInput,Mout,bin0,bin1 : std_logic_vector(31 downto 0);


begin

Instr <= instruction;

IFSTAGE0:IFSTAGE
port map(
	PC_immed => immediate,
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
	
BReg32BitR:Reg32BitR	
port map(
	Clk => Clk,
	WrEn => B_Control,
	Reset => '0',
	Din => RF_B,
	Dout => B);
	
ALUSTAGE0:ALUSTAGE
port map(
	RF_A => A,
	RF_B => B,
	Immed => immediate,
	ALU_Bin_sel =>ALU_Bin_sel, 
	ALU_func => ALU_func, 
	ALU_out => S, 
	Zero => Zero);
	
SReg32BitR:Reg32BitR	
port map(
	Clk => Clk,
	WrEn => S_Control,
	Reset => '0',
	Din => S,
	Dout => ALU_out);
	
	bin0 <= "000000000000000000000000" & B(7 downto 0);
	
mux0 : mux32Bit
port map(
	sel => sizeControl, 
	A => B,
	B => bin0,
	Outt => memInput);

Data_MEM0:Data_MEM
port map(
	clk => Clk,
	we => MEM_WrEn,
	addr => ALU_out(11 downto 2),
	din => memInput,
	dout => Mout);
	
	bin1 <= "000000000000000000000000" & Mout(7 downto 0);
	
mux1 : mux32Bit
port map(
	sel => sizeControl, 
	A => Mout,
	B => bin1,
	Outt => MEM_out);


end Behavioral;




