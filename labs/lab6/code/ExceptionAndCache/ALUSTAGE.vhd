library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALUSTAGE is
    Port ( RF_A : in  STD_LOGIC_VECTOR (31 downto 0);
           RF_B : in  STD_LOGIC_VECTOR (31 downto 0);
           Immed : in  STD_LOGIC_VECTOR (31 downto 0);
           ALU_Bin_sel : in  STD_LOGIC;
           ALU_func : in  STD_LOGIC_VECTOR (3 downto 0);
           ALU_out : inout  STD_LOGIC_VECTOR (31 downto 0));
end ALUSTAGE;

architecture Behavioral of ALUSTAGE is

COMPONENT mux32Bit
port(
	sel : in  STD_LOGIC;
	A : in  STD_LOGIC_VECTOR (31 downto 0);
	B : in  STD_LOGIC_VECTOR (31 downto 0);
	Outt : out  STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;

COMPONENT ALU
port(
	A : in  STD_LOGIC_VECTOR (31 downto 0);
	B : in  STD_LOGIC_VECTOR (31 downto 0);
	Op : in  STD_LOGIC_VECTOR (3 downto 0);
	Outt : inout  STD_LOGIC_VECTOR (31 downto 0);
	Zero : inout  STD_LOGIC;
	Cout : inout  STD_LOGIC;
	Ovf : inout  STD_LOGIC);
END COMPONENT;

signal muxOut : STD_LOGIC_VECTOR (31 downto 0);

begin

mux32Bit0:mux32Bit
port map(
	sel => ALU_Bin_sel,
	A => RF_B,
	B => Immed,
	Outt => muxOut);
	
ALU0:ALU
port map(
	A => RF_A,
	B => muxOut,
	Op => ALU_func,
	Outt => ALU_out);

end Behavioral;

