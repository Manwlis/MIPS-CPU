----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:56:44 05/07/2017 
-- Design Name: 
-- Module Name:    Reg128BitR - Behavioral 
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

entity Reg128BitR is
    Port ( Clk : in  STD_LOGIC;
           WrEn : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Din : in  STD_LOGIC_VECTOR (127 downto 0);
           Dout : inout  STD_LOGIC_VECTOR (127 downto 0));
end Reg128BitR;

architecture Behavioral of Reg128BitR is

COMPONENT Reg32BitR
Port ( 
	Clk : in  STD_LOGIC;
 WrEn : in  STD_LOGIC;
 Reset : in STD_LOGIC;
 Din : in  STD_LOGIC_VECTOR (31 downto 0); 
 Dout : inout  STD_LOGIC_VECTOR (31 downto 0));	  
END COMPONENT;	

begin


Reg127_96:Reg32BitR	
port map(
	Clk => Clk,
	WrEn => WrEn,
	Reset => Reset,
	Din => Din(127 downto 96),
	Dout => Dout(127 downto 96));

Reg95_64:Reg32BitR	
port map(
	Clk => Clk,
	WrEn => WrEn,
	Reset => Reset,
	Din => Din(95 downto 64),
	Dout => Dout(95 downto 64));
	
Reg63_32:Reg32BitR	
port map(
	Clk => Clk,
	WrEn => WrEn,
	Reset => Reset,
	Din => Din(63 downto 32),
	Dout => Dout(63 downto 32));
	
Reg31_0:Reg32BitR	
port map(
	Clk => Clk,
	WrEn => WrEn,
	Reset => Reset,
	Din => Din(31 downto 0),
	Dout => Dout(31 downto 0));
	
end Behavioral;

