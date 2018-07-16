library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Reg4Bit is
    Port ( Clk : in  STD_LOGIC;
           WrEn : in  STD_LOGIC;
           Din : in  STD_LOGIC_VECTOR (3 downto 0);
           Dout : inout  STD_LOGIC_VECTOR (3 downto 0);
			  RST : in STD_LOGIC);
end Reg4Bit;

architecture Structural of Reg4Bit is

COMPONENT Reg1Bit
port
(Clk,WrEn,Din,RST : in std_logic;
 Dout : inout std_logic);
END COMPONENT;

begin

Reg1Bit3:Reg1Bit
port map(
  Clk => Clk,
  RST => RST,
  WrEn => WrEn,
  Din => Din(3),
  Dout => Dout(3));
  
Reg1Bit2:Reg1Bit
port map(
  Clk => Clk,
  RST => RST,
  WrEn => WrEn,
  Din => Din(2),
  Dout => Dout(2));
  
Reg1Bit1:Reg1Bit
port map(
  Clk => Clk,
  RST => RST,
  WrEn => WrEn,
  Din => Din(1),
  Dout => Dout(1));
  
Reg1Bit0:Reg1Bit
port map(
  Clk => Clk,
  RST => RST,
  WrEn => WrEn,
  Din => Din(0),
  Dout => Dout(0));

end Structural;

