library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity FSM is
Port ( 
	Instr : in  STD_LOGIC_VECTOR (31 downto 0);
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
	IR_Control : out  STD_LOGIC;
	S_control : out  STD_LOGIC;
	A_Control : out  STD_LOGIC;
	ALUop : out STD_LOGIC_VECTOR (2 downto 0);
	B_Control : out  STD_LOGIC;
	InstrBeforeIR : in STD_LOGIC_VECTOR (31 downto 0);
	AddByte_Fill : out  STD_LOGIC_VECTOR (2 downto 0);
	AddByte_Empty : out  STD_LOGIC;
	Reg8Bit31_24_WrEn  : out  STD_LOGIC;
	Reg8Bit23_16_WrEn  : out  STD_LOGIC;
	Reg8Bit15_8_WrEn  : out  STD_LOGIC;
	MemtoBctr : out  STD_LOGIC;
	packByte7_0_WrEn  : out  STD_LOGIC;			  
	packByte15_8_WrEn  : out  STD_LOGIC;	
	packByte23_16_WrEn  : out  STD_LOGIC;
	MEM_DataINSel : out  STD_LOGIC_VECTOR (2 downto 0);
	Addrsel : out  STD_LOGIC;
	ASBtoMEMaddr : out  STD_LOGIC_VECTOR (1 downto 0));
end FSM;

architecture Behavioral of FSM is

type state is (ResetState, InstrFetch, InstrDecode_bsl, InstrDecode_Ri,
InstrDecode_b, AluStage_sli, AluStage_Rb, nop, store, load, RegisterStore, preload,
AddByteA, AddByteB, AddByteC, AddByteD, bneBtoMEM, bneMEMtoB, bytePackA, bytePackB, bytePackC, bytePackD, byteUnpackA, byteUnpackB, byteUnpackC, byteUnpackD);
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
				if InstrBeforeIR(31 downto 26) = "111110" then
					nextState <= InstrDecode_bsl; --byte_unpack
				elsif InstrBeforeIR(31 downto 26) = "111100" then
					nextState <= InstrDecode_Ri; --byte_pack
				elsif (InstrBeforeIR(31 downto 26) = "100111") or (InstrBeforeIR(31 downto 26) = "101111") then
					nextState <= InstrDecode_bsl; --beqRM kai bneMEM
				elsif InstrBeforeIR(31 downto 26) = "100011" then
					nextState <= InstrDecode_Ri; --Add_MMX_byte
				elsif InstrBeforeIR(31 downto 26) = "100001" then
					nextState <= InstrDecode_Ri; --cmov
				elsif InstrBeforeIR = "00000000000000000000000000000000" then
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
				MemtoBctr <= '0';
				ASBtoMEMaddr <= "01";
				Addrsel <= '0';
				--next states
				if Opcode = "111110" then
					nextState <= AluStage_sli; --byte_unpack
				elsif Opcode = "101111" then
					nextState <= bneBtoMEM; --bneMEM
				elsif Opcode = "100111" then
					nextState <= AluStage_Rb; --beqRM
				elsif Opcode(5 downto 1) = "00000" then
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
				MemtoBctr <= '0';
				--next states
				if Opcode = "111100" then
					nextState <= AluStage_sli; --byte_pack
				elsif Opcode = "100001" then
					nextState <= AluStage_Rb; --cmov
				elsif Opcode = "100011" then
					nextState <= AddByteA; --Add_MMX_byte
				elsif Opcode(5 downto 4) = "10" then
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
				
			when bneBtoMEM => 
				--shmata
				ASBtoMEMaddr <= "10";
				A_Control <= '0';
				B_Control <= '0';
				PC_LdEn <= '0';
				RF_WrEn <= '0';
				MEM_WrEn <= '0';
				Addrsel <= '0';
				--next states
				nextState <= bneMEMtoB;
			
			when bneMEMtoB =>
				--shmata
				B_Control <= '1';
				MemtoBctr <= '1';
				ASBtoMEMaddr <= "00";
				PC_LdEn <= '0';
				RF_WrEn <= '0';
				MEM_WrEn <= '0';
				Addrsel <= '0';
				--next states
				nextState <= AluStage_Rb;
				
			when AluStage_sli =>
				--shmata
				S_Control <= '1';
				ALU_Bin_sel <= '1';
				IR_Control <= '0';
				PC_LdEn <= '0';
				RF_WrEn <= '0';
				MEM_WrEn <= '0';
				B_Control <='0';
				AddByte_Empty  <= '0';
				AddByte_Fill <= "000";
				MEM_DataINSel <= "000";
				if Opcode = "110010" then--and
					ALUop <= "001";
				elsif Opcode = "110011" then--or
					ALUop <= "010";
				else --add
					ALUop <= "000";
				end if;
				--next states
				if Opcode = "111110" then
					nextState <= byteUnpackA; --byte_unpack
				elsif Opcode = "111100" then
					nextState <= bytePackA; --byte_pack
				elsif (Opcode = "000111") or (Opcode = "011111") then
					nextState <= store;
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
				AddByte_Empty  <= '0';
				AddByte_Fill <= "000";
				-- ALU op
				--if Opcode = "100111" then --backup gia thn beqRM.
				--	ALUop <= "011";
				if Opcode = "100000" then
					ALUop <= "100";
				else
					ALUop <= "011"; --pane oi bneRM kai oi bneMEM.
				end if;
				--next states
				if (Opcode = "100111" and Zero = '1') or (Opcode = "101111" and Zero = '0') then
					nextState <= InstrDecode_b; --beqRM petiximeno kai bneMEM apotiximeno.
				elsif (Opcode = "100111" and Zero = '0') or (Opcode = "101111" and Zero = '1') then
					nextState <= nop; --beqRM apotiximeno kai bneMEM epitiximeno
				elsif Opcode = "100001" and Zero = '0' then
					nextState <= RegisterStore; --cmov epitiximeno
				elsif Opcode = "100001" and Zero = '1' then
					nextState <= nop; --cmov apotiximeno
				elsif Opcode = "100000" then
					nextState <= RegisterStore;
				elsif ((Opcode(0) = '0' and Zero = '1') or (Opcode(0) = '1' and Zero = '0')) then
					nextState <= InstrDecode_b;
				else
					nextState <= nop;
				end if;
			
			when bytePackA =>
				--shmata
				PC_LdEn <= '0';
				RF_WrEn <= '0';
				MEM_WrEn <= '0';
				ASBtoMEMaddr <= "01";
				AddrSel <= '0';
				--next states
				nextState <= bytePackB;
				
			when bytePackB =>
				--shmata
				PC_LdEn <= '0';
				RF_WrEn <= '0';
				MEM_WrEn <= '0';
				AddrSel <= '1';
				packByte7_0_WrEn <= '1';
				--next states
				nextState <= bytePackC;	
				
			when bytePackC =>
				--shmata
				PC_LdEn <= '0';
				RF_WrEn <= '0';
				MEM_WrEn <= '0';
				AddrSel <= '1';
				packByte7_0_WrEn <= '0';
				packByte15_8_WrEn <= '1';
				--next states
				nextState <= bytePackD;		
				
			when bytePackD =>
				--shmata
				PC_LdEn <= '0';
				RF_WrEn <= '0';
				MEM_WrEn <= '0';
				AddrSel <= '1';
				packByte7_0_WrEn <= '0';
				packByte15_8_WrEn <= '0';
				packByte23_16_WrEn <= '1';
				--next states
				nextState <= load;		
				
			when byteUnpackA =>
				--shmata
				PC_LdEn <= '0';
				RF_WrEn <= '0';
				MEM_WrEn <= '1';
				ASBtoMEMaddr <= "01";
				AddrSel <= '0';
				MEM_DataINSel <= "001";
				B_Control <= '0';
				
				--next states
				nextState <= byteUnpackB;
				
				
			when byteUnpackB =>
				--shmata
				PC_LdEn <= '0';
				RF_WrEn <= '0';
				MEM_WrEn <= '1';
				AddrSel <= '1';
				MEM_DataINSel <= "010";
				B_Control <= '0';				
				--next states
				nextState <= byteUnpackC;
				
			when byteUnpackC =>
				--shmata
				PC_LdEn <= '0';
				RF_WrEn <= '0';
				MEM_WrEn <= '1';
				AddrSel <= '1';
				MEM_DataINSel <= "011";
				B_Control <= '0';						
				--next states
				nextState <= byteUnpackD;					
				
			when byteUnpackD =>
				--shmata
				PC_LdEn <= '1';
				PC_sel <= '0';
				RF_WrEn <= '0';
				MEM_WrEn <= '1';
				AddrSel <= '1';
				MEM_DataINSel <= "100";						
				--next states
				nextState <= InstrFetch;					
					
			when AddByteA =>
				--shmata
				A_Control <= '0';
				B_Control <= '0';
				IR_Control <= '0';
				PC_LdEn <= '0';
				RF_WrEn <= '0';
				MEM_WrEn <= '0';
				ALUOp <= "000";
				ALU_Bin_sel <= '0';
				AddByte_Empty <= '1';
				AddByte_Fill <= "001";
				Reg8Bit31_24_WrEn <= '1';
				--next states
				nextState <= AddByteB;
				
			when AddByteB =>
				--shmata
				A_Control <= '0';
				B_Control <= '0';
				IR_Control <= '0';
				PC_LdEn <= '0';
				RF_WrEn <= '0';
				MEM_WrEn <= '0';
				ALUOp <= "000";
				ALU_Bin_sel <= '0';
				AddByte_Empty <= '1';
				AddByte_Fill <= "010";
				Reg8Bit31_24_WrEn <= '0';
				Reg8Bit23_16_WrEn <= '1';
				--next states
				nextState <= AddByteC;
				
			when AddByteC =>
				--shmata
				A_Control <= '0';
				B_Control <= '0';
				IR_Control <= '0';
				PC_LdEn <= '0';
				RF_WrEn <= '0';
				MEM_WrEn <= '0';
				ALUOp <= "000";
				ALU_Bin_sel <= '0';
				AddByte_Empty <= '1';
				AddByte_Fill <= "011";
				Reg8Bit31_24_WrEn <= '0';
				Reg8Bit23_16_WrEn <= '0';
				Reg8Bit15_8_WrEn <= '1';
				--next states
				nextState <= AddByteD;				

			when AddByteD =>
				--shmata
				A_Control <= '0';
				B_Control <= '0';
				S_Control <= '1';
				IR_Control <= '0';
				PC_LdEn <= '0';
				RF_WrEn <= '0';
				MEM_WrEn <= '0';
				ALUOp <= "000";
				ALU_Bin_sel <= '0';
				AddByte_Empty <= '1';
				AddByte_Fill <= "100";
			--	Reg8Bit31_24_WrEn <= '0';
			--	Reg8Bit23_16_WrEn <= '0';
			--	Reg8Bit15_8_WrEn <= '0';
				--next states
				nextState <= RegisterStore;					
				
			when nop =>
				--shmata
				PC_LdEn <= '1';
				PC_Sel <= '0';
				RF_WrEn <= '0';
				MEM_WrEn <= '0';
				--next states
				nextState <= InstrFetch;
				
			when store =>
				--shmata
				MEM_WrEn <= '1';
				RF_WrEn <= '0';
				PC_Sel <= '0';
				PC_LdEn <= '1';
				ASBtoMEMaddr <= "01";
				Addrsel <= '0';
				MEM_DataINSel <= "000";
				--next states
				nextState <= InstrFetch;
				
			when preload =>
				--shmata
				MEM_WrEn <= '0';
				RF_WrEn <= '0';
				PC_LdEn <= '0';
				ASBtoMEMaddr <= "01";
				Addrsel <= '0';
				--next states
				nextState <= load;
				
			when load =>
				--shmata
				MEM_WrEn <= '0';
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

