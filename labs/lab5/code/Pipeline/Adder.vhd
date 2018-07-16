library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Adder is
    Port ( input0 : in  STD_LOGIC_VECTOR (31 downto 0);
           input1 : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end Adder;

architecture Behavioral of Adder is

signal shiftedImmed :STD_LOGIC_VECTOR (31 downto 0);
begin

shiftedImmed <= input1(29 downto 0) & "00";
output <= input0 + shiftedImmed;

end Behavioral;

