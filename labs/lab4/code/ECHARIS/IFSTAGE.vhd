library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IFSTAGE is
    Port ( PC_immed : in  STD_LOGIC_VECTOR (31 downto 0);
           PC_sel : in  STD_LOGIC;
           PC_LdEn : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Instr : out  STD_LOGIC_VECTOR (31 downto 0));
end IFSTAGE;

architecture Structral of IFSTAGE is

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

COMPONENT Adder
Port ( 
	input0 : in  STD_LOGIC_VECTOR (31 downto 0);
	input1 : in  STD_LOGIC_VECTOR (31 downto 0);
	output : out  STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;	

COMPONENT Incrementor
Port ( 
	input : in  STD_LOGIC_VECTOR (31 downto 0);
	output : out  STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;	

COMPONENT IF_MEM
Port ( 
	clk : in std_logic;
	addr : in std_logic_vector(9 downto 0);
	dout : out std_logic_vector(31 downto 0));
END COMPONENT;	

Signal muxOut, regOut, IncrementorOut, AdderOut : STD_LOGIC_VECTOR (31 downto 0);

begin

Reg32BitR0:Reg32BitR
port map(
	Clk => Clk,
	WrEn => PC_LdEn,
	Reset => Reset,
	Din => muxOut,
	Dout=> regOut);
	
IF_MEM0:IF_MEM
port map(
	clk => Clk,
	addr => regOut(11 downto 2),
	dout => Instr);
	
Incrementor0:Incrementor
port map(
	input => regOut,
	output => IncrementorOut);
	
Adder0:Adder
port map(
	input0 => IncrementorOut,
	input1 => PC_immed,
	output => AdderOut);
	
mux32Bit0:mux32Bit
port map(
	sel => PC_sel,
	A => IncrementorOut,
	B => AdderOut,
	outt => muxOut);
	

end Structral;

