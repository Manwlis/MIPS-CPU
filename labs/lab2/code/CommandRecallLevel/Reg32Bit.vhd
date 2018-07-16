library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg32Bit is
    Port ( Clk : in  STD_LOGIC;
           WrEn : in  STD_LOGIC;
			  RST : in  STD_LOGIC;
           Din : in  STD_LOGIC_VECTOR (31 downto 0);
           Dout : inout  STD_LOGIC_VECTOR (31 downto 0));
end Reg32Bit;

architecture Structural of Reg32Bit is

COMPONENT Reg4Bit
port
(Clk,WrEn,RST : in std_logic;
 Din : in  STD_LOGIC_VECTOR (3 downto 0);
 Dout : inout std_logic_VECTOR (3 downto 0));
END COMPONENT;

begin

Reg4Bit31_28:Reg4Bit
port map(
  Clk => Clk,
  RST => RST,
  WrEn => WrEn,
  Din => Din(31 downto 28),
  Dout => Dout(31 downto 28));

Reg4Bit27_24:Reg4Bit
port map(
  Clk => Clk,
  RST => RST,
  WrEn => WrEn,
  Din => Din(27 downto 24),
  Dout => Dout(27 downto 24));
  
Reg4Bit23_20:Reg4Bit
port map(
  Clk => Clk,
  RST => RST,
  WrEn => WrEn,
  Din => Din(23 downto 20),
  Dout => Dout(23 downto 20));
  
Reg4Bit19_16:Reg4Bit
port map(
  Clk => Clk,
  RST => RST,
  WrEn => WrEn,
  Din => Din(19 downto 16),
  Dout => Dout(19 downto 16));
  
Reg4Bit15_12:Reg4Bit
port map(
  Clk => Clk,
  RST => RST,
  WrEn => WrEn,
  Din => Din(15 downto 12),
  Dout => Dout(15 downto 12));

Reg4Bit11_8:Reg4Bit
port map(
  Clk => Clk,
  RST => RST,
  WrEn => WrEn,
  Din => Din(11 downto 8),
  Dout => Dout(11 downto 8));
  
Reg4Bit7_4:Reg4Bit
port map(
  Clk => Clk,
  RST => RST,
  WrEn => WrEn,
  Din => Din(7 downto 4),
  Dout => Dout(7 downto 4));
  
Reg4Bit3_0:Reg4Bit
port map(
  Clk => Clk,
  RST => RST,
  WrEn => WrEn,
  Din => Din(3 downto 0),
  Dout => Dout(3 downto 0));
  
end Structural;