library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity Cache is
port (
	clk : in std_logic;
	index : in std_logic_vector(4 downto 0);
	dout : out std_logic_vector(131 downto 0));
end Cache;

architecture syn of Cache is

type cache_type is array (31 downto 0) of std_logic_vector (131 downto 0);

impure function InitcacheFromFile (cacheFileName : in string) return cache_type is
FILE cachefile : text is in cacheFileName;
variable cacheFileLine : line;
variable cache : cache_type;
begin
	for i in 0 to 31 loop
		readline(cachefile, cacheFileLine);
		read (cacheFileLine, cache(i));
	end loop;
return cache;
end function;

signal CACHE : cache_type := InitcacheFromFile("cache.data");

begin
	process (clk)
	begin
	if clk'event and clk = '1' then
			dout <= CACHE(conv_integer(index)) ;
	end if;
	end process;

end syn;