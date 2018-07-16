library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           Op : in  STD_LOGIC_VECTOR (3 downto 0);
           Outt : inout  STD_LOGIC_VECTOR (31 downto 0);
           Zero : inout  STD_LOGIC;
           Cout : inout  STD_LOGIC;
           Ovf : inout  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is
signal OutEs : STD_LOGIC_VECTOR (32 downto 0);
signal BEs : STD_LOGIC_VECTOR (31 downto 0);

begin

AluProcess: process (A,B,Op,Outt,Zero,Cout,Ovf,OutEs)
  begin
  
    case Op is
	 
	   when "0000" =>
		  OutEs <= ('0' & A) + ('0' & B);
		  Outt <= OutEs(31 downto 0);
		  if ((A(31) = '0' and B(31) = '0' and Outt(31) = '1') or (A(31) = '1' and B(31) = '1' and Outt(31) = '0')) then 
		    Ovf <= '1';    ---an + kai + = - h - kai - = + overflow
		  else Ovf <= '0';
		  end if;
		  if (Outt = "00000000000000000000000000000000") then Zero <= '1'; --"00000000000000000000000000000000"
		  else Zero <= '0';
		  end if;
		  Cout <= OutEs(32);
		  BEs <= "00000000000000000000000000000000";
		  
		when "0001" =>
		  BEs <= (not B) + 1;
		  OutEs <= ('0' & A) + ('0' & BEs);
		  Outt <= OutEs(31 downto 0);
		  if ((A(31) = '0' and B(31) = '1' and Outt(31) = '1') or (A(31) = '1' and B(31) = '0' and Outt(31) = '0')) then 
		    Ovf <= '1';    ---an + plhn - = - h - plhn + = + overflow
		  else Ovf <= '0';
		  end if;
		  if (Outt = "00000000000000000000000000000000") then Zero <= '1';
		  else Zero <= '0';
		  end if;
		  Cout <= OutEs(32);
		  
		when "0010" =>
		  Outt <= A and B;
		  Ovf <= '0';
		  if (Outt = "00000000000000000000000000000000") then Zero <= '1';
		  else Zero <= '0';
		  end if;
		  Cout <= '0';
		  OutEs <= "000000000000000000000000000000000";
		  BEs <= "00000000000000000000000000000000";
		  
		when "0011" =>
		  Outt <= A or B;
		  Ovf <= '0';
		  if (Outt = "00000000000000000000000000000000") then Zero <= '1';
		  else Zero <= '0';
		  end if;
		  Cout <= '0';
		  OutEs <= "000000000000000000000000000000000";
		  BEs <= "00000000000000000000000000000000";
		  
		when "0100" =>
		  Outt <= not A;
		  Ovf <= '0';
		  if (Outt = "00000000000000000000000000000000") then Zero <= '1';
		  else Zero <= '0';
		  end if;
		  Cout <= '0';
		  OutEs <= "000000000000000000000000000000000";
		  BEs <= "00000000000000000000000000000000";
		  
		when "1000" =>
		  Outt <=A(31) & A(31 downto 1);
		  Ovf <= '0';
		  if (Outt = "00000000000000000000000000000000") then Zero <= '1';
		  else Zero <= '0';
		  end if;
		  Cout <= '0';
		  OutEs <= "000000000000000000000000000000000";
		  BEs <= "00000000000000000000000000000000";
		  
		when "1001" =>
		  Outt <= '0' & A(31 downto 1) ;
		  Ovf <= '0';
        if (Outt = "00000000000000000000000000000000") then Zero <= '1';
		  else Zero <= '0';
		  end if;	
		  Cout <= '0';	  
		  OutEs <= "000000000000000000000000000000000";
		  BEs <= "00000000000000000000000000000000";
		  
		  
		when "1010" =>
		  Outt <= A(30 downto 0) & '0';
		  Ovf <= '0';	
        if (Outt = "00000000000000000000000000000000") then Zero <= '1';
		  else Zero <= '0';
		  end if;	
		  Cout <= '0';
        OutEs <= "000000000000000000000000000000000";	
		  BEs <= "00000000000000000000000000000000";	  
		  
		when "1100" =>
		  Outt <= A(30 downto 0) & A(31);
		  Ovf <= '0';	
		  if (Outt = "00000000000000000000000000000000") then Zero <= '1';
		  else Zero <= '0';
		  end if;
		  Cout <= '0';
		  OutEs <= "000000000000000000000000000000000";
		  BEs <= "00000000000000000000000000000000";
		  
		when "1101" =>
		  Outt <= A(0) & A(31 downto 1);
		  Outt(31) <= A(0);
		  Ovf <= '0';	
		  if (Outt = "00000000000000000000000000000000") then Zero <= '1';
		  else Zero <= '0';
		  end if;
		  Cout <= '0';
		  OutEs <= "000000000000000000000000000000000";
		  BEs <= "00000000000000000000000000000000";
		  
		when others =>
		  Outt <= "00000000000000000000000000000000";
		  OutEs <= "000000000000000000000000000000000";
		  BEs <= "00000000000000000000000000000000";
		  Ovf <= '0';	
		  Cout <= '0';
		  Zero <= '0';
		   
	 end case;
  end process;


end Behavioral;

