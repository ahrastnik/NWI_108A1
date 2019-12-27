library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;
library work;
use work.INSTRUCTS.all;

entity CPU is
	port(
		clk, rst: in std_logic;
		we: out std_logic := '0';
		irqs: in unsigned(5 downto 0) := (others => '0');
		-- ROM
		rom_adr_a, rom_adr_b: out std_logic_vector(9 downto 0);
		rom_data_a, rom_data_b: in std_logic_vector(7 downto 0);
		-- Data Bus
		address: out unsigned(9 downto 0) := (others => '0');
		data_o: 	out unsigned(7 downto 0) := (others => '0');
		data_i: 	in unsigned(7 downto 0)
	);
end CPU;

architecture Malibu of CPU is
	-- Constants
	constant PROG_START: 	unsigned(7 downto 0) := x"08";
	constant STACK_POINTER: unsigned(7 downto 0) := x"C0";
	
	-- States
	type states is (reset, prefetch, fetch, execute, func);
	signal state: states := reset;

	-- CPU Properties
	signal pc: unsigned(7 downto 0) := PROG_START;-- Program Counter starts after the Interrupt Vector Table
	signal stack: unsigned(7 downto 0) := STACK_POINTER;-- Stack Pointer
	signal conf: unsigned(7 downto 0) := "10000000";-- Config Register: 7 -> Interrupts Enabled, 6 ->, 5 ->, 4 ->, 3 ->, 2 -> , 1 -> , 0 -> ;
	signal stat: unsigned(7 downto 0) := (others => '0');-- Status Register: 7 -> Interrupt Request, 6 -> 1 or 2 Byte Instruction, 5 -> Function/ISR Call Error
		--, 4 ->, 3 ->, 2 -> Carry, 1 -> Negative, 0 -> Zero;
	signal cont: unsigned(7 downto 0) := (others => '0');-- Control Register: 7 -> First Intstruction Fetched/Pipelining Started, 6 -> Exited all Funciton/ISR Nests
		--, 5 -> Interrupt Serviced, 4 -> Interrupt Loaded, 3 -> Stack Store/Load, 2-0 -> Stack Counter;
	signal retr: unsigned(7 downto 0) := (others => '0');-- Return Register: Shows the next instruction address after Funciton/ISR
	signal nest: unsigned(7 downto 0) := (others => '0');-- Nest Counter: Counts in how many Funciton/ISR nests we are
	signal inst, inst_next: unsigned(7 downto 0) := (others => '0');-- Instruction for Execute
	
	-- General Purpose Registers
	type gpr is array(0 to 3) of unsigned(7 downto 0);-- General Purpose register
	signal gprs: gpr := (others => x"00");
	
	-- ALU
	signal acu: unsigned(7 downto 0);
	signal reg1, reg2: unsigned(7 downto 0) := (others => '0');
	
	-- Interrupt Controller
	signal irq_adr: unsigned(7 downto 0);
	
	-- ROM
	signal rom_adr: unsigned(9 downto 0);
	signal rom_data, rom_data_next: unsigned(7 downto 0);
	
	component ALU
		port(
			clk: in std_logic;
			op, a, b: in unsigned(7 downto 0);
			result: out unsigned(7 downto 0);
			carry, zero, negat: out std_logic
		);
	end component;
	
	component INTERRUPT
		port(
			clk, ire, isr, clr: in std_logic; -- Clock, Interrupts Enabled, Interrupt Serviced
			irqs: in unsigned(5 downto 0); -- Interrupt Requests
			irq: out std_logic; -- Interrupt Request
			irq_adr: out unsigned(7 downto 0)
		);
	end component;

begin
	U_ALU: ALU port map(clk => clk, op => rom_data, a => reg1, b => reg2, result => acu, carry => stat(2), negat => stat(1), zero => stat(0));
	U_INT: INTERRUPT port map(clk => clk, ire => '1', irqs => irqs, clr => cont(6), irq => stat(7), isr => cont(5), irq_adr => irq_adr);
	
	rom_data <= unsigned(rom_data_a);
	rom_data_next <= unsigned(rom_data_b);
	
	main:process(clk)
	begin
		clkr:if(rising_edge(clk)) then
			we <= '0';
			cont(5) <= '0'; -- Clear Interrupt Serviced
			cont(6) <= '0'; -- Exited all Funciton/ISR Nests
			st:case state is
				when reset =>
					-- RESET
					pc <= PROG_START; -- Set PC to the Start of the Program
					stack <= stack - cont(2 downto 0); -- Reset Stack Pointer
					cont <= (others => '0'); -- Reset Control Register
					
					if(rst = '1') then
						state <= fetch;-- Continue if the Reset is over
					end if;
					
				when prefetch =>
					-- PRE-FETCH -> Pre Fetch Data after a Reset
					state <= fetch;
					
				when fetch =>
					-- FETCH
					iffet:if(rst = '1') then
						-- Handle Managment Instructions
						mng:case rom_data(7 downto 4) is
							when jmp =>
								pc <= rom_data_next;
								
							when call =>
								callpc:if(rom_data(7) = '0' and rom_data(6) = '1') then
									pc <= pc + 2;
									callpcrt1:if(stat(7) = '0') then
										retr <= pc + 2;
									end if callpcrt1;
								else
									pc <= pc + 1;
									callpcrt2:if(stat(7) = '0') then
										retr <= pc + 1;
									end if callpcrt2;
								end if callpc;
								
								ir:if(stat(7) = '1') then
									cont(5) <= '1'; -- Set Interrupt Serviced
								end if ir;
								
							when lda =>
								--ldaif:if(rom_data(1 downto 0) = prog) then
								--	gprs(to_integer(rom_data(3 downto 2))) <= rom_data_next;
								--else
								--	gprs(to_integer(rom_data(3 downto 2))) <= ram_data;
								--end if ldaif;
								null;
								
							when sta =>
								--data_o <= gprs(to_integer(rom_data(1 downto 0)));
								--we <= '1';
								if_cpu_sta:if(rom_data_next >= 16) then
									data_o <= gprs(to_integer(rom_data(1 downto 0)));
								else
									null;
								end if if_cpu_sta;
								we <= '1';
							when nop =>
								null;
								
							when ret =>
								null;
								
							when copy =>
								null;
							
							when jezr =>
								if_ez:if(stat(2) = '1') then
									pc <= pc + rom_data(3 downto 0);
								else
									pc <= pc + 1;
								end if if_ez;
								
							when others =>
								null;
						end case mng;
						
						-- Store instruction
						inst <= rom_data;
						inst_next <= rom_data_next;
						--cont(4) <= '0';-- Reset Interrupt Loaded
						-- Set Instruction is 1 or 2 bytes long
						cyc:if(rom_data(7) = '0' and rom_data(6) = '1') then
							stat(6) <= '1';
						else
							stat(6) <= '0';
						end if cyc;
						
						-- State Selection
						jm_st:if(rom_data(7 downto 4) = jmp or rom_data(7 downto 4) = jezr) then
							state <= fetch;
						elsif(rom_data(7 downto 4) = call or rom_data(7 downto 4) = ret) then
							-- Reset Stack counters if Neasting
							nest_cr:if(rom_data(7 downto 4) = call) then
								cont(3 downto 0) <= (others => '0');
								
								state <= func;
							else
								nest_err:if(nest = 0) then
									-- Call Error, when returning and no Funciton/ISR calls were made
									stat(5) <= '1';
									
									state <= reset;
								else
									cont(3 downto 0) <= "1110";
									
									state <= func;
								end if nest_err;
							end if nest_cr;
						else
							state <= execute;
						end if jm_st;
					else
						-- Go to Reset
						state <= reset;
					end if iffet;
					
				when execute =>
					-- EXECUTE
					exe:if(rst = '1') then
						alu_c:case inst(7 downto 4) is
							when lda =>
								ldi:if(inst(1 downto 0) = prog) then
									gprs(to_integer(inst(3 downto 2))) <= inst_next;
								else
									-- Load CPU data if in CPU address Space
									if_cpu_lda:if(inst_next < 16) then
										sp_cpu:case inst_next is
											when x"00" =>
												gprs(to_integer(inst(3 downto 2))) <= gprs(0);
											when x"01" =>
												gprs(to_integer(inst(3 downto 2))) <= gprs(1);
											when x"02" =>
												gprs(to_integer(inst(3 downto 2))) <= gprs(2);
											when x"03" =>
												gprs(to_integer(inst(3 downto 2))) <= gprs(3);
											when x"04" =>
												gprs(to_integer(inst(3 downto 2))) <= stat;
											when x"05" =>
												gprs(to_integer(inst(3 downto 2))) <= retr;
											when others =>
												null;
										end case sp_cpu;
									else
										gprs(to_integer(inst(3 downto 2))) <= data_i;
									end if if_cpu_lda;
								end if ldi;
								
							when sta =>
								null;
								
							when copy =>
								gprs(to_integer(inst(3 downto 2))) <= gprs(to_integer(inst(1 downto 0)));
								
							when jezr =>
								null;
								
							when others =>
								null;
						end case alu_c;
						
						-- Increment PC
						hirq:if(stat(7) = '0') then
							ifpc:if(stat(6) = '1') then
								pc <= pc + 2;
							else
								pc <= pc + 1;
							end if ifpc;
						else
							pc <= irq_adr;
							ifpc2:if(stat(6) = '1') then
								retr <= pc + 2;
							else
								retr <= pc + 1;
							end if ifpc2;
						end if hirq;
						
						-- Load ALU data in GPR
						stalu:if(inst(7) = '1') then
							gprs(to_integer(inst(3 downto 2))) <= acu;
						end if stalu;
						
						state <= fetch;
					else
						-- Go to Reset if Requested
						state <= reset;
					end if exe;
					
				when func =>
					fnc:if(rst = '1') then
						-- FUNCTION/ISR
						mfw:if(cont(3) = '0') then
							-- Enter Function/ISR
							str:if(cont(2 downto 0) < 4) then
								-- Store General Purpose Registers
								cont(2 downto 0) <= cont(2 downto 0) + 1;
								stack <= stack + 1;
								data_o <= gprs(to_integer(cont(2 downto 0)));
								we <= '1';
							else
								str1:if(cont(2 downto 0) = 4) then
									-- Load Status Register
									data_o <= stat;
									cont(2 downto 0) <= cont(2 downto 0) + 1;
									stack <= stack + 1;
									we <= '1';
								elsif(cont(2 downto 0) = 5) then
									-- Store the PC/Return Register
									cont(2 downto 0) <= cont(2 downto 0) + 1;
									stack <= stack + 1;
									we <= '1';
									data_o <= retr;
									cont(4) <= '1';
								elsif(cont(2 downto 0) = 6) then
									cont(4) <= '0';
									-- Start Function/ISR
									cont(3) <= '1';-- Set Stack in Load Mode
									-- Set the Function/ISR address in PC
									pc <= inst_next;
									-- Increment Nest Counter
									nest <= nest + 1;
									
									state <= fetch;
								end if str1;
							end if str;
						else
							-- Exit Function/ISR
							ld:if(cont(2 downto 0) = 6) then
								-- Load PC
								cont(2 downto 0) <= cont(2 downto 0) - 1;
								stack <= stack - 1;
								pc <= data_i;
							elsif(cont(2 downto 0) = 5) then
								-- Load Status Register
								cont(2 downto 0) <= cont(2 downto 0) - 1;
								stack <= stack - 1;
								--stat <= ram_adr;
							elsif(cont(2 downto 0) < 5 and cont(2 downto 0) > 0) then
								-- Load General Purpose Registers
								cont(2 downto 0) <= cont(2 downto 0) - 1;
								stack <= stack - 1;
								gprs(to_integer(cont(2 downto 0))-1) <= data_i;
							elsif(cont(2 downto 0) = 0) then
								-- Return to the Main Program
								cont(3) <= '0';-- Set Stack in Store Mode
								-- Decrement Nest Counter
								nest <= nest - 1;
								
								-- Clear Nested Interrupts
								nest_clr:if((nest - 1) = 0) then
									cont(6) <= '1';
								end if nest_clr;
								
								state <= fetch;
							end if ld;
						end if mfw;
					else
						-- Go to Reset if Requested
						state <= reset;
					end if fnc;
			end case st;
		end if clkr;
	end process main;
	
	-- Read ALU
	reg1 <= gprs(to_integer(rom_data(1 downto 0)));
	reg2 <= gprs(to_integer(rom_data(3 downto 2)));
	
	-- Set ROM addresses
	rom_adr <= "00" & PROG_START when state = reset else
		"00" & rom_data_next when state = fetch and rom_data(7 downto 4) = jmp else
		"00" & (pc+rom_data(3 downto 0)) when state = fetch and rom_data(7 downto 4) = jezr and stat(2) = '1' else
		"00" & (pc+1) when state = fetch and rom_data(7 downto 4) = jezr and stat(2) = '0' else
		"00" & irq_adr when state = execute and stat(7) = '1' else
		"00" & inst_next when state = func and cont(4) = '1' else
		"00" & retr when state = func and cont(3) = '1' else
		"00" & pc + 1 when state = execute and stat(6) = '0' else
		"00" & pc + 2 when state = execute and stat(6) = '1' else
		(others => '0');
	
	rom_adr_a <= std_logic_vector(rom_adr);
	rom_adr_b <= std_logic_vector(rom_adr + 1);
	
	-- Set IO/RAM Address
	address <= "00" & rom_data_next when (rom_data(7 downto 4) = lda or rom_data(7 downto 4) = sta) and state = fetch else
		"00" & inst_next when (inst(7 downto 4) = lda or inst(7 downto 4) = sta) and state = execute else
		stack & "00" when (state = fetch and rom_data(7 downto 4) = ret) or (state = func and cont(3) = '0') else
		(stack-1) & "00" when state = func and cont(3) = '1' else
		(others => '0');
end Malibu;