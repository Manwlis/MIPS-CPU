library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Data_MEM is
	port (
		clk : in std_logic;
		we : in std_logic;
		addr : in std_logic_vector(9 downto 0);
		din : in std_logic_vector(31 downto 0);
		dout : out std_logic_vector(31 downto 0));
	end Data_MEM;

architecture syn of Data_MEM is
	type ram_type is array (1023 downto 0) of std_logic_vector (31 downto 0);

	impure function InitRam return ram_type is
	variable ram : ram_type;
	begin
		for i in 0 to 1023 loop
			ram(i) := x"00000000";
		end loop;
	return ram;
	end function;

	signal RAM: ram_type := InitRam;

	begin
		process (clk)
		begin
			if clk'event and clk = '1' then
				if we = '1' then
					RAM(conv_integer(addr)) <= din;
				end if;
				dout <= RAM(conv_integer(addr)) ;
			end if;
		end process;
end syn;