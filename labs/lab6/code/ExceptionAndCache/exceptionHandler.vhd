----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:38:09 05/03/2017 
-- Design Name: 
-- Module Name:    exceptionHandler - Behavioral 
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

entity exceptionHandler is
	Port ( Clk : in  STD_LOGIC;
		Reset : in  STD_LOGIC;	
		PCbeforeIMEM : in  STD_LOGIC_VECTOR (31 downto 0);	
		Instr :in STD_LOGIC_VECTOR (31 downto 0);
		PC  : in  STD_LOGIC_VECTOR (31 downto 0);	
		killCommandExc : out STD_LOGIC;	
		PC_sel : out STD_LOGIC_VECTOR (1 downto 0);
		EPC : inout STD_LOGIC_VECTOR (31 downto 0);
		PC_EPCmuxCtr : out STD_LOGIC;
		address  : in  STD_LOGIC_VECTOR (31 downto 0));
end exceptionHandler;

architecture Behavioral of exceptionHandler is

COMPONENT Reg32BitR
Port ( 
	Clk : in  STD_LOGIC;
 WrEn : in  STD_LOGIC;
 Reset : in STD_LOGIC;
 Din : in  STD_LOGIC_VECTOR (31 downto 0); 
 Dout : inout  STD_LOGIC_VECTOR (31 downto 0));	  
END COMPONENT;	

COMPONENT exceptionFinder
Port (
	Instr : in  STD_LOGIC_VECTOR (31 downto 0);
	PC_sel : out STD_LOGIC_VECTOR (1 downto 0);
	FSMstart : out STD_LOGIC;
	killAsynchronous : out STD_LOGIC;
	JumpFound  : out STD_LOGIC;
	cs : out STD_LOGIC_VECTOR (31 downto 0);
	address  : in  STD_LOGIC_VECTOR (31 downto 0));	
END COMPONENT;	

COMPONENT exceptionFSM 
Port ( 
	Clk : in  STD_LOGIC;
	Reset : in  STD_LOGIC;
	FSMstart : in  STD_LOGIC;
	JumpFound : in  STD_LOGIC;
	killSynchronous : out  STD_LOGIC;
	EPCenable : out  STD_LOGIC);
end COMPONENT;


COMPONENT mux2to1_2bit
    Port ( A : in  STD_LOGIC_VECTOR (1 downto 0);
           B : in  STD_LOGIC_VECTOR (1 downto 0);
           sel : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (1 downto 0));
end COMPONENT;

signal FSMstart, killAsynchronous, killSynchronous, JumpFound, EPCenable : STD_LOGIC;
signal cs, cause : STD_LOGIC_VECTOR (31 downto 0);
signal PC_selInitial : STD_LOGIC_VECTOR (1 downto 0);

begin

EPCreg : Reg32BitR
port map(
	Clk => Clk,
	WrEn => EPCenable,
	Reset => '0',
	Din => PC,
	Dout => EPC);

CSreg : Reg32BitR
port map(
	Clk => Clk,
	WrEn => EPCenable,
	Reset => '0',
	Din => cs,
	Dout => cause);
	
exceptionFinder0 : exceptionFinder
port map(
	Instr => Instr,
	PC_sel => PC_selInitial,
	FSMstart => FSMstart,
	killAsynchronous => killAsynchronous,
	JumpFound => JumpFound,
	address => address,
	cs => cs);

PC_EPCmuxCtr <= not JumpFound;
 

exceptionFSM0 : exceptionFSM
port map(
	Clk => Clk,
	Reset => Reset,
	FSMstart => FSMstart,
	JumpFound => JumpFound,
	killSynchronous => killSynchronous,
	EPCenable => EPCenable);
 
killCommandExc <= killAsynchronous or killSynchronous;

mux2to1_2bit0 : mux2to1_2bit
port map(
	A => PC_selInitial,
	B => "00",
	sel => killSynchronous,
	output => PC_sel);
	

end Behavioral;

