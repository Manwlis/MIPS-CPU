library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ImmedBox is
    Port ( Instr : in  STD_LOGIC_VECTOR (15 downto 0);
           Immed : out  STD_LOGIC_VECTOR (31 downto 0);
			  Sl_Control : in STD_LOGIC;
			  Zf_Se_Control: in STD_LOGIC);
end ImmedBox;

architecture Structural of ImmedBox is


COMPONENT mux16Bit
port
(sel : in  STD_LOGIC;
 A : in  STD_LOGIC_VECTOR (15 downto 0);
 B : in  STD_LOGIC_VECTOR (15 downto 0);
 Outt : out  STD_LOGIC_VECTOR (15 downto 0));
END COMPONENT;

Signal b,shifted, signExtension, extension : STD_LOGIC_VECTOR (15 downto 0);
begin

b <= (Instr(13 downto 0) & "00");

mux16Bit0:mux16Bit
port map(
	sel => Sl_Control,
	A =>Instr(15 downto 0),
	B => b,
	Outt => shifted);

mux16Bit1:mux16Bit
port map(
	sel => Instr(15),
	A => "0000000000000000",
	B => "1111111111111111",
	Outt => signExtension);

mux16Bit2:mux16Bit
port map(
	sel => Zf_Se_Control,
	A => "0000000000000000",
	B => signExtension,
	Outt => extension);

Immed <= extension & shifted;

end Structural;

