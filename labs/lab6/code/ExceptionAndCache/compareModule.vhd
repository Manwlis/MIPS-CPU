library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity compareModule is
    Port ( Ard : in  STD_LOGIC_VECTOR (4 downto 0);
           Awr: in  STD_LOGIC_VECTOR (4 downto 0);
			  WrEn : in  STD_LOGIC;
           output : out  STD_LOGIC);
end compareModule;

architecture Behavioral of compareModule is

begin

output <= WrEn AND((Ard(4) XNOR Awr(4)) AND  (Ard(3) XNOR Awr(3)) AND  (Ard(2) XNOR Awr(2)) AND  (Ard(1) XNOR Awr(1)) AND  (Ard(0) XNOR Awr(0)));

end Behavioral;

