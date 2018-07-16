library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Incrementor is
    Port ( input : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end Incrementor;

architecture Behavioral of Incrementor is

begin

output <= input + "00000000000000000000000000000100";

end Behavioral;

