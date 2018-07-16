library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity IF_MEM is
port (
	clk : in std_logic;
	addr : in std_logic_vector(9 downto 0);
	dout : out std_logic_vector(31 downto 0));
end IF_MEM;

architecture syn of IF_MEM is

type rom_type is array (1023 downto 0) of std_logic_vector (31 downto 0);

impure function InitRomFromFile (RomFileName : in string) return rom_type is
FILE romfile : text is in RomFileName;
variable RomFileLine : line;
variable rom : rom_type;
begin
	for i in 0 to 1023 loop
		readline(romfile, RomFileLine);
		read (RomFileLine, rom(i));
	end loop;
return rom;
end function;

signal ROM : rom_type := InitRomFromFile("rombonus.data");

begin
	process (clk)
	begin
	if clk'event and clk = '1' then
			dout <= ROM(conv_integer(addr)) ;
	end if;
	end process;

end syn;