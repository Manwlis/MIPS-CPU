library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity FSM is
    Port ( Instr : in  STD_LOGIC_VECTOR (31 downto 0);
           Reset : in  STD_LOGIC;
			  Clk: in  STD_LOGIC;
			  Zero: in  STD_LOGIC;
           RF_B_sel : out  STD_LOGIC;
           RF_WrData_sel : out  STD_LOGIC;
           RF_WrEn : out  STD_LOGIC;
           ALU_Bin_sel : out  STD_LOGIC;
           MEM_WrEn : out  STD_LOGIC;
           PC_SEL : out  STD_LOGIC;
           PC_LdEn : out  STD_LOGIC;
           sizeControl : out  STD_LOGIC;
           IR_Control : out  STD_LOGIC;
           S_control : out  STD_LOGIC;
           A_Control : out  STD_LOGIC;
	        ALUop : out STD_LOGIC_VECTOR (2 downto 0);
           B_Control : out  STD_LOGIC;
			  InstrBeforeIR : in STD_LOGIC_VECTOR (31 downto 0));
end FSM;

architecture Behavioral of FSM is

type state is (ResetState, InstrFetch, InstrDecode_bsl, InstrDecode_Ri,
InstrDecode_b, AluStage_sli, AluStage_Rb, nop, sb, sw, lb, lw, RegisterStore, preload);
signal currentState, nextState: state;
signal Opcode: STD_LOGIC_VECTOR (5 downto 0);

begin

Opcode <= Instr(31 downto 26);

FSM_Process: process (currentState, Opcode, Reset, Instr, Zero, InstrBeforeIR)
	begin
	
		case currentState is
		
			when ResetState =>
				--
				RF_B_sel <= '0';
           RF_WrData_sel <= '0';
           ALU_Bin_sel  <= '0';
           PC_SEL  <= '0';
           PC_LdEn  <= '0';
           sizeControl  <= '0';
           IR_Control  <= '0';
           S_control  <= '0';
           A_Control  <= '0';
	        ALUop  <= "000";
           B_Control  <= '0';
				--shmata
				RF_WrEn <= '0';
				MEM_WrEn <= '0';
				--next states
				nextState <= InstrFetch;
				
			when InstrFetch =>
				--shmata
				IR_Control <= '1';
				PC_LdEn <= '0';
				RF_WrEn <= '0';
				MEM_WrEn <= '0';
				--next states
				if InstrBeforeIR = "00000000000000000000000000000000" then
					nextState <= nop;
				elsif InstrBeforeIR(31 downto 26) = "111111" then	
					nextState <= InstrDecode_b;
				elsif InstrBeforeIR(31) = '0' then
					nextState <= InstrDecode_bsl;
				else
					nextState <= InstrDecode_Ri;
				end if;
		
			when InstrDecode_bsl =>
				--shmata
				RF_B_sel <= '1';
				A_Control <= '1';
				B_Control <= '1';
				IR_Control <= '0';
				PC_LdEn <= '0';
				RF_WrEn <= '0';
				MEM_WrEn <= '0';
				--next states
				if Opcode(5 downto 1) = "00000" then
					nextState <= AluStage_Rb;
				else
					nextState <= AluStage_sli;
				end if;
				
			when InstrDecode_Ri =>
				--shmata
				RF_B_sel <= '0';
				A_Control <= '1';
				B_Control <='1';
				IR_Control <= '0';
				PC_LdEn <= '0';
				RF_WrEn <= '0';
				MEM_WrEn <= '0';
				--next states
				if Opcode(5 downto 4) = "10" then
					nextState <= AluStage_Rb;
				else
					nextState <= AluStage_sli;
				end if;
				
			when InstrDecode_b =>
				--shmata
				PC_LdEn <= '1';
				PC_Sel <= '1';
				RF_WrEn <= '0';
				MEM_WrEn <= '0';
				--next states
				nextState <= nop;
				
			when AluStage_sli =>
				--shmata
				S_Control <= '1';
				ALU_Bin_sel <= '1';
				IR_Control <= '0';
				PC_LdEn <= '0';
				RF_WrEn <= '0';
				MEM_WrEn <= '0';
				B_Control <='0';
				if Opcode = "110010" then--and
					ALUop <= "001";
				elsif Opcode = "110011" then--or
					ALUop <= "010";
				else --add
					ALUop <= "000";
				end if;
				--next states
				if Opcode = "000111" then
					nextState <= sb;
				elsif Opcode = "011111" then
					nextState <= sw;
				elsif Opcode(5 downto 4) = "00" then
					nextState <= preload;
				else
					nextState <= RegisterStore;
				end if;
				
			when AluStage_Rb =>
				--shmata
				S_Control <= '1';
				ALU_Bin_sel <= '0';
				IR_Control <= '0';
				PC_LdEn <= '0';
				RF_WrEn <= '0';
				MEM_WrEn <= '0';
				if Opcode = "100000" then
					ALUop <= "100";
				else
					ALUop <= "011";
				end if;
				--next states
				if Opcode = "100000" then
					nextState <= RegisterStore;
				elsif ((Opcode(0) = '0' and Zero = '1') or (Opcode(0) = '1' and Zero = '0')) then
					nextState <= InstrDecode_b;
				else
					nextState <= nop;
				end if;
				
			when nop =>
				--shmata
				PC_LdEn <= '1';
				PC_Sel <= '0';
				RF_WrEn <= '0';
				MEM_WrEn <= '0';
				--next states
				nextState <= InstrFetch;
				
			when sb =>
				--shmata
				MEM_WrEn <= '1';
				RF_WrEn <= '0';
				sizeControl <= '1';
				PC_Sel <= '0';
				PC_LdEn <= '1';
				--next states
				nextState <= InstrFetch;
				
			when sw =>
				--shmata
				MEM_WrEn <= '1';
				RF_WrEn <= '0';
				sizeControl <= '0';
				PC_Sel <= '0';
				PC_LdEn <= '1';
				--next states
				nextState <= InstrFetch;
				
			when preload =>
				--shmata
				MEM_WrEn <= '0';
				RF_WrEn <= '0';
				PC_LdEn <= '0';
				--next states
				if Opcode = "000011" then
					nextState <= lb;
				else
					nextState <= lw;
				end if;
				
			when lb =>
				--shmata
				MEM_WrEn <= '0';
				sizeControl <= '1';
				RF_WrData_sel <= '0';
				RF_WrEn <= '1';
				PC_Sel <= '0';
				PC_LdEn <= '1';
				--next states
				nextState <= InstrFetch;
				
			when lw =>
				--shmata
				MEM_WrEn <= '0';
				sizeControl <= '0';
				RF_WrData_sel <= '0';
				RF_WrEn <= '1';
				PC_Sel <= '0';
				PC_LdEn <= '1';
				--next states
				nextState <= InstrFetch;
				
			when RegisterStore =>
				--shmata
				RF_WrEn <= '1';
				RF_WrData_sel <= '1';
				MEM_WrEn <= '0';
				PC_LdEn <= '1';
				PC_Sel <= '0';
				--next states
				nextState <= InstrFetch;
	
			when others => 
				RF_WrEn <= '0';
				MEM_WrEn <= '0';
				nextState <= nop;
			
		end case;
	end process;

FSM_CLOCK:  PROCESS (Clk,Reset)
begin
	if Reset = '1' then 
		currentState <= ResetState;
	elsif (rising_edge(Clk)) then 
		currentState <= nextState;
	end if;
end process;

end Behavioral;

