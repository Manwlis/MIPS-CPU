library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RegisterFile is
    Port ( Ard1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Ard2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Awr : in  STD_LOGIC_VECTOR (4 downto 0);
           Dout1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Dout2 : out  STD_LOGIC_VECTOR (31 downto 0);
           Din : in  STD_LOGIC_VECTOR (31 downto 0);
           WrEn : in  STD_LOGIC;
           Clk : in  STD_LOGIC);
end RegisterFile;

architecture Behavioral of RegisterFile is

COMPONENT mux32Bit
port
(sel : in  STD_LOGIC;
 A : in  STD_LOGIC_VECTOR (31 downto 0);
 B : in  STD_LOGIC_VECTOR (31 downto 0);
 Outt : out  STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;

COMPONENT mux32to1_32Bit
Port (
 in0 : in  STD_LOGIC_VECTOR (31 downto 0);
 in1 : in  STD_LOGIC_VECTOR (31 downto 0);
 in2 : in  STD_LOGIC_VECTOR (31 downto 0);
 in3 : in  STD_LOGIC_VECTOR (31 downto 0);
 in4 : in  STD_LOGIC_VECTOR (31 downto 0);
 in5 : in  STD_LOGIC_VECTOR (31 downto 0);
 in6 : in  STD_LOGIC_VECTOR (31 downto 0);
 in7 : in  STD_LOGIC_VECTOR (31 downto 0);
 in8 : in  STD_LOGIC_VECTOR (31 downto 0);
 in9 : in  STD_LOGIC_VECTOR (31 downto 0);
 in10 : in  STD_LOGIC_VECTOR (31 downto 0);
 in11 : in  STD_LOGIC_VECTOR (31 downto 0);
 in12 : in  STD_LOGIC_VECTOR (31 downto 0);
 in13 : in  STD_LOGIC_VECTOR (31 downto 0);
 in14 : in  STD_LOGIC_VECTOR (31 downto 0);
 in15 : in  STD_LOGIC_VECTOR (31 downto 0);
 in16 : in  STD_LOGIC_VECTOR (31 downto 0);
 in17 : in  STD_LOGIC_VECTOR (31 downto 0);
 in18 : in  STD_LOGIC_VECTOR (31 downto 0);
 in19 : in  STD_LOGIC_VECTOR (31 downto 0);
 in20 : in  STD_LOGIC_VECTOR (31 downto 0);
 in21 : in  STD_LOGIC_VECTOR (31 downto 0);
 in22 : in  STD_LOGIC_VECTOR (31 downto 0);
 in23 : in  STD_LOGIC_VECTOR (31 downto 0);
 in24 : in  STD_LOGIC_VECTOR (31 downto 0);
 in25 : in  STD_LOGIC_VECTOR (31 downto 0);
 in26 : in  STD_LOGIC_VECTOR (31 downto 0);
 in27 : in  STD_LOGIC_VECTOR (31 downto 0);
 in28 : in  STD_LOGIC_VECTOR (31 downto 0);
 in29 : in  STD_LOGIC_VECTOR (31 downto 0);
 in30 : in  STD_LOGIC_VECTOR (31 downto 0);
 in31 : in  STD_LOGIC_VECTOR (31 downto 0);
 sel : in  STD_LOGIC_VECTOR (4 downto 0);
 output : out  STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;	

COMPONENT compareModule
Port (
 Ard : in  STD_LOGIC_VECTOR (4 downto 0);
 Awr: in  STD_LOGIC_VECTOR (4 downto 0);
 output : out  STD_LOGIC);
END COMPONENT;	

COMPONENT Decoder5to32
Port ( 
 s : in  STD_LOGIC_VECTOR (4 downto 0);
 output : out  STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;	

COMPONENT Reg32Bit
Port ( Clk : in  STD_LOGIC;
 WrEn : in  STD_LOGIC;
 Din : in  STD_LOGIC_VECTOR (31 downto 0); 
 Dout : inout  STD_LOGIC_VECTOR (31 downto 0));	  
END COMPONENT;	

signal we   : STD_LOGIC_VECTOR (31 downto 1);
signal decoderEn  : STD_LOGIC_VECTOR (31 downto 0);
signal mux1out,mux0out : STD_LOGIC_VECTOR (31 downto 0);
signal mux1sel,mux2sel : STD_LOGIC;

type array2D is array (0 to 31) of std_logic_vector(31 downto 0);
signal  registerOut : array2D;

begin

Decoder5to32_0 : Decoder5to32
port map(
 s => Awr,
 output => decoderEn);

we(1) <= WrEn AND decoderEn(1);
we(2) <= WrEn AND decoderEn(2);
we(3) <= WrEn AND decoderEn(3);
we(4) <= WrEn AND decoderEn(4);
we(5) <= WrEn AND decoderEn(5);
we(6) <= WrEn AND decoderEn(6);
we(7) <= WrEn AND decoderEn(7);
we(8) <= WrEn AND decoderEn(8);
we(9) <= WrEn AND decoderEn(9);
we(10) <= WrEn AND decoderEn(10);
we(11) <= WrEn AND decoderEn(11);
we(12) <= WrEn AND decoderEn(12);
we(13) <= WrEn AND decoderEn(13);
we(14) <= WrEn AND decoderEn(14);
we(15) <= WrEn AND decoderEn(15);
we(16) <= WrEn AND decoderEn(16);
we(17) <= WrEn AND decoderEn(17);
we(18) <= WrEn AND decoderEn(18);
we(19) <= WrEn AND decoderEn(19);
we(20) <= WrEn AND decoderEn(20);
we(21) <= WrEn AND decoderEn(21);
we(22) <= WrEn AND decoderEn(22);
we(23) <= WrEn AND decoderEn(23);
we(24) <= WrEn AND decoderEn(24);
we(25) <= WrEn AND decoderEn(25);
we(26) <= WrEn AND decoderEn(26);
we(27) <= WrEn AND decoderEn(27);
we(28) <= WrEn AND decoderEn(28);
we(29) <= WrEn AND decoderEn(29);
we(30) <= WrEn AND decoderEn(30);
we(31) <= WrEn AND decoderEn(31);

Reg32Bit0 : Reg32Bit
port map(
 Clk => Clk,
 WrEn => '1',
 Din => "00000000000000000000000000000000",
 Dout => registerOut(0));
 
Reg32Bit1 : Reg32Bit
port map(
 Clk => Clk,
 WrEn => we(1),
 Din => Din,
 Dout => registerOut(1));
 
Reg32Bit2 : Reg32Bit
port map(
 Clk => Clk,
 WrEn => we(2),
 Din => Din,
 Dout => registerOut(2));

Reg32Bit3 : Reg32Bit
port map(
 Clk => Clk,
 WrEn => we(3),
 Din => Din,
 Dout => registerOut(3)); 

Reg32Bit4 : Reg32Bit
port map(
 Clk => Clk,
 WrEn => we(4),
 Din => Din,
 Dout => registerOut(4));

Reg32Bit5 : Reg32Bit
port map(
 Clk => Clk,
 WrEn => we(5),
 Din => Din,
 Dout => registerOut(5));

Reg32Bit6 : Reg32Bit
port map(
 Clk => Clk,
 WrEn => we(6),
 Din => Din,
 Dout => registerOut(6));
 
Reg32Bit7 : Reg32Bit
port map(
 Clk => Clk,
 WrEn => we(7),
 Din => Din,
 Dout => registerOut(7));
 
Reg32Bit8 : Reg32Bit
port map(
 Clk => Clk,
 WrEn => we(8),
 Din => Din,
 Dout => registerOut(8)); 
 
Reg32Bit9 : Reg32Bit
port map(
 Clk => Clk,
 WrEn => we(9),
 Din => Din,
 Dout => registerOut(9)); 
 
Reg32Bit10 : Reg32Bit
port map(
 Clk => Clk,
 WrEn => we(10),
 Din => Din,
 Dout => registerOut(10)); 
 
Reg32Bit11 : Reg32Bit
port map(
 Clk => Clk,
 WrEn => we(11),
 Din => Din,
 Dout => registerOut(11)); 
 
Reg32Bit12 : Reg32Bit
port map(
 Clk => Clk,
 WrEn => we(12),
 Din => Din,
 Dout => registerOut(12)); 
 
Reg32Bit13 : Reg32Bit
port map(
 Clk => Clk,
 WrEn => we(13),
 Din => Din,
 Dout => registerOut(13)); 
 
Reg32Bit14 : Reg32Bit
port map(
 Clk => Clk,
 WrEn => we(14),
 Din => Din,
 Dout => registerOut(14)); 
 
Reg32Bit15 : Reg32Bit
port map(
 Clk => Clk,
 WrEn => we(15),
 Din => Din,
 Dout => registerOut(15)); 
 
Reg32Bit16 : Reg32Bit
port map(
 Clk => Clk,
 WrEn => we(16),
 Din => Din,
 Dout => registerOut(16)); 
 
Reg32Bit17 : Reg32Bit
port map(
 Clk => Clk,
 WrEn => we(17),
 Din => Din,
 Dout => registerOut(17)); 
 
Reg32Bit18 : Reg32Bit
port map(
 Clk => Clk,
 WrEn => we(18),
 Din => Din,
 Dout => registerOut(18)); 
 
Reg32Bit19 : Reg32Bit
port map(
 Clk => Clk,
 WrEn => we(19),
 Din => Din,
 Dout => registerOut(19)); 
 
Reg32Bit20 : Reg32Bit
port map(
 Clk => Clk,
 WrEn => we(20),
 Din => Din,
 Dout => registerOut(20)); 
 
Reg32Bit21 : Reg32Bit
port map(
 Clk => Clk,
 WrEn => we(21),
 Din => Din,
 Dout => registerOut(21)); 
 
Reg32Bit22 : Reg32Bit
port map(
 Clk => Clk,
 WrEn => we(22),
 Din => Din,
 Dout => registerOut(22));
 
Reg32Bit23 : Reg32Bit
port map(
 Clk => Clk,
 WrEn => we(23),
 Din => Din,
 Dout => registerOut(23));
 
Reg32Bit24 : Reg32Bit
port map(
 Clk => Clk,
 WrEn => we(24),
 Din => Din,
 Dout => registerOut(24)); 
 
Reg32Bit25 : Reg32Bit
port map(
 Clk => Clk,
 WrEn => we(25),
 Din => Din,
 Dout => registerOut(25));

Reg32Bit26 : Reg32Bit
port map(
 Clk => Clk,
 WrEn => we(26),
 Din => Din,
 Dout => registerOut(26));
 
 Reg32Bit27 : Reg32Bit
port map(
 Clk => Clk,
 WrEn => we(27),
 Din => Din,
 Dout => registerOut(27));
 
Reg32Bit28 : Reg32Bit
port map(
 Clk => Clk,
 WrEn => we(28),
 Din => Din,
 Dout => registerOut(28)); 
 
Reg32Bit29 : Reg32Bit
port map(
 Clk => Clk,
 WrEn => we(29),
 Din => Din,
 Dout => registerOut(29));
 
Reg32Bit30 : Reg32Bit
port map(
 Clk => Clk,
 WrEn => we(30),
 Din => Din,
 Dout => registerOut(30));

Reg32Bit31 : Reg32Bit
port map(
 Clk => Clk,
 WrEn => we(31),
 Din => Din,
 Dout => registerOut(31));


mux32to1_32Bit_0 : mux32to1_32Bit
port map(
 in0 => registerOut(0),
 in1 => registerOut(1),
 in2 => registerOut(2),
 in3 => registerOut(3),
 in4 => registerOut(4),
 in5 => registerOut(5),
 in6 => registerOut(6),
 in7 => registerOut(7),
 in8 => registerOut(8),
 in9 => registerOut(9),
 in10 => registerOut(10),
 in11 => registerOut(11),
 in12 => registerOut(12),
 in13 => registerOut(13),
 in14 => registerOut(14),
 in15 => registerOut(15),
 in16 => registerOut(16),
 in17 => registerOut(17),
 in18 => registerOut(18),
 in19 => registerOut(19),
 in20 => registerOut(20),
 in21 => registerOut(21),
 in22 => registerOut(22),
 in23 => registerOut(23),
 in24 => registerOut(24),
 in25 => registerOut(25),
 in26 => registerOut(26),
 in27 => registerOut(27),
 in28 => registerOut(28),
 in29 => registerOut(29),
 in30 => registerOut(30), 
 in31 => registerOut(31),
 sel => Ard1,
 output => mux0out);
  
mux32to1_32Bit_1 : mux32to1_32Bit
port map(
 in0 => registerOut(0),
 in1 => registerOut(1),
 in2 => registerOut(2),
 in3 => registerOut(3),
 in4 => registerOut(4),
 in5 => registerOut(5),
 in6 => registerOut(6),
 in7 => registerOut(7),
 in8 => registerOut(8),
 in9 => registerOut(9),
 in10 => registerOut(10),
 in11 => registerOut(11),
 in12 => registerOut(12),
 in13 => registerOut(13),
 in14 => registerOut(14),
 in15 => registerOut(15),
 in16 => registerOut(16),
 in17 => registerOut(17),
 in18 => registerOut(18),
 in19 => registerOut(19),
 in20 => registerOut(20),
 in21 => registerOut(21),
 in22 => registerOut(22),
 in23 => registerOut(23),
 in24 => registerOut(24),
 in25 => registerOut(25),
 in26 => registerOut(26),
 in27 => registerOut(27),
 in28 => registerOut(28),
 in29 => registerOut(29),
 in30 => registerOut(30), 
 in31 => registerOut(31),
 sel => Ard2,
 output => mux1out);
  
compareModule0: compareModule
port map(
 Ard => Ard1,  
 Awr => Awr,
 output => mux1sel);

compareModule1: compareModule
port map(
 Ard => Ard2,  
 Awr => Awr,
 output => mux2sel);

mux32Bit_0: mux32Bit
port map(
 sel => mux1sel,
 A => mux0out,
 B => Din,
 Outt => Dout1);

mux32Bit_1: mux32Bit
port map(
 sel => mux2sel,
 A => mux1out,
 B => Din,
 Outt => Dout2);

 
end Behavioral;


