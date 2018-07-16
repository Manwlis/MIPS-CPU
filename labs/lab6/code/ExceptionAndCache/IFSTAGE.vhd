library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IFSTAGE is
    Port ( PC_immed : in  STD_LOGIC_VECTOR (31 downto 0);
           PC_sel : in  STD_LOGIC_VECTOR (1 downto 0);
           PC_LdEn : in  STD_LOGIC;
           PC_EPCmuxCtr : in  STD_LOGIC;
			  EPC : in STD_LOGIC_VECTOR (31 downto 0);
           Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           PC : out  STD_LOGIC_VECTOR (31 downto 0);
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

COMPONENT mux4to1_32Bit
Port ( 
A : in  STD_LOGIC_VECTOR (31 downto 0);
B : in  STD_LOGIC_VECTOR (31 downto 0);
C : in  STD_LOGIC_VECTOR (31 downto 0);
D : in  STD_LOGIC_VECTOR (31 downto 0);
sel : in  STD_LOGIC_VECTOR (1 downto 0);
output : out STD_LOGIC_VECTOR (31 downto 0));
end  COMPONENT;

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

Signal muxOut, regOut, IncrementorOut, AdderOut, IncrementorIn: STD_LOGIC_VECTOR (31 downto 0);
begin

Reg32BitR0:Reg32BitR
port map(
	Clk => Clk,
	WrEn => PC_LdEn,
	Reset => Reset,
	Din => muxOut,
	Dout=> regOut);

PC <= regOut;
	
IF_MEM0:IF_MEM
port map(
	clk => Clk,
	addr => regOut(11 downto 2),
	dout => Instr);
	
	--epc me 0 / pc me 1
PC_EPCmux : mux32Bit
port map(
	sel => PC_EPCmuxCtr, 
	A => EPC,
	B => regOut,
	Outt => IncrementorIn);	

Incrementor0:Incrementor
port map(
	input => IncrementorIn,
	output => IncrementorOut);
		
mux4to1_32Bit0:mux4to1_32Bit
port map(
	sel => PC_sel,
	A => IncrementorOut,
	B => "00000000000000000000000100000000", --0x100
	C => "00000000000000000000001000000000", --0x200
	D => "00000000000000000000000000000000",
	output => muxOut);
	

end Structral;

