----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:13:31 02/11/2017 
-- Design Name: 
-- Module Name:    Reg1Bit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Reg1Bit is
    Port ( Clk : in  STD_LOGIC;
           WrEn : in  STD_LOGIC;
           Din : in  STD_LOGIC;
           Dout : inout  STD_LOGIC;
			  RST : in STD_LOGIC);
end Reg1Bit;

architecture Behavioral of Reg1Bit is

COMPONENT flipflop
port
(CLK,RST,d: in std_logic;
 q : out std_logic);
END COMPONENT;

COMPONENT mux
port
(in0,in1,sel: in std_logic;
 output : out std_logic);
END COMPONENT;

signal muxOut  : std_logic;

begin

mux0:mux
port map(
   in0 => Dout,
	in1 => Din,
	sel => WrEn,
	output => muxOut);
	
flipflop0: flipflop
port map (
   CLK =>Clk,
	RST =>RST,
	d=>muxOut,
	q=>Dout);
	

end Behavioral;

