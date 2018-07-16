library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg8Bit is
    Port ( Clk : in  STD_LOGIC;
           Din : in  STD_LOGIC_VECTOR (7 downto 0);
           WrEn : in  STD_LOGIC;
           Dout : inout  STD_LOGIC_VECTOR (7 downto 0));
end Reg8Bit;

architecture Behavioral of Reg8Bit is

COMPONENT Reg4Bit
port
(Clk,WrEn : in std_logic;
 Din : in  STD_LOGIC_VECTOR (3 downto 0);
 Dout : inout std_logic_VECTOR (3 downto 0));
END COMPONENT;

begin

Reg4Bit1:Reg4Bit
port map(
  Clk => Clk,
  WrEn => WrEn,
  Din => Din(7 downto 4),
  Dout => Dout(7 downto 4));
  
Reg4Bit0:Reg4Bit
port map(
  Clk => Clk,
  WrEn => WrEn,
  Din => Din(3 downto 0),
  Dout => Dout(3 downto 0));

end Behavioral;

