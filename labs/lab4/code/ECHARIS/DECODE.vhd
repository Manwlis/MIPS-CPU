library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity DECODE is
    Port ( Instr : in  STD_LOGIC_VECTOR (31 downto 0);
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
end DECODE;

architecture Behavioral of DECODE is

COMPONENT RegisterFile
port(
	Ard1 : in  STD_LOGIC_VECTOR (4 downto 0);
	Ard2 : in  STD_LOGIC_VECTOR (4 downto 0);
	Awr : in  STD_LOGIC_VECTOR (4 downto 0);
	Dout1 : out  STD_LOGIC_VECTOR (31 downto 0);
	Dout2 : out  STD_LOGIC_VECTOR (31 downto 0);
	Din : in  STD_LOGIC_VECTOR (31 downto 0);
	WrEn : in  STD_LOGIC;
	Clk : in  STD_LOGIC);
END COMPONENT;

COMPONENT mux5Bit
port(
	sel : in  STD_LOGIC;
	A : in  STD_LOGIC_VECTOR (4 downto 0);
	B : in  STD_LOGIC_VECTOR (4 downto 0);
	Outt : out  STD_LOGIC_VECTOR (4 downto 0));
END COMPONENT;

COMPONENT mux32Bit
port(
	sel : in  STD_LOGIC;
	A : in  STD_LOGIC_VECTOR (31 downto 0);
	B : in  STD_LOGIC_VECTOR (31 downto 0);
	Outt : out  STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;

COMPONENT ImmedBox
port(
	Instr : in  STD_LOGIC_VECTOR (15 downto 0);
	Immed : out  STD_LOGIC_VECTOR (31 downto 0);
	Sl_Control : in STD_LOGIC;
	Zf_Se_Control: in STD_LOGIC);
END COMPONENT;

signal RF_in2 : STD_LOGIC_VECTOR (4 downto 0);
signal muxOut : STD_LOGIC_VECTOR (31 downto 0);

begin

ImmedBox0:ImmedBox
port map(
	Instr => Instr(15 downto 0),
	Immed => Immed,
	Sl_Control => Sl_Control,
	Zf_Se_Control => Zf_Se_Control);
	
mux5Bit0:mux5Bit
port map(
	sel => RF_B_sel,
	A => Instr(15 downto 11),
	B => Instr(20 downto 16),
	Outt => RF_in2);
	
RegisterFile0:RegisterFile
port map(
	Ard1 => Instr(25 downto 21),
	Ard2 => RF_in2,
	Awr => Instr(20 downto 16),
	Dout1 => RF_A,
	Dout2 => RF_B,
	Din => muxOut,
	WrEn => RF_WrEn,
	Clk => Clk);
	
mux32Bit0:mux32Bit
port map(
	sel => RF_WrData_sel,
	A => MEM_out,
	B => ALU_out,
	Outt => muxOut);

end Behavioral;

