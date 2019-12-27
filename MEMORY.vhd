library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;
library work;
use work.INSTRUCTS.all;

entity MEMORY is
	port(
		clk, we: in std_logic; -- Clock, Write Enable
		prog_adr, ram_adr: in unsigned(7 downto 0); -- Memory Address
		din: in unsigned(7 downto 0); -- Data in
		dout, next_dout, ram_dout: out unsigned(7 downto 0) -- Output Data
	);
end MEMORY;

architecture Malibu of MEMORY is
	type memory is array(0 to 255) of unsigned(7 downto 0);
	signal datamem: memory := (x"00", x"08", x"00", x"0F", x"3F", x"00", x"FD", x"01", "10100010", others => x"00");
	constant progmem: memory := (
		
		-- Interrupt Vector Table
		call & x"0", -- RESET
		x"08",
		call & x"0", -- INT0
		x"19",
		call & x"0", -- INT1
		x"08",
		call & x"0", -- TIMER
		x"1C",
		-- Program
		lda & r0 & ram, -- PC <= 0x08
		x"08",
		sta & ram & r0,
		x"00",
		lda & r0 & ram,
		x"06",
		-- Main
		lda & r1 & ram,
		x"07",
		add & r0 & r1,
		sta & ram & r0,
		x"06",
		jmp & x"0",
		x"0E",
		call & x"0",
		x"19",
		jmp & x"0",
		x"0E",
		-- Function 1
		lda & r2 & ram,
		x"06",
		--call & x"0",
		--x"1C",
		ret & x"0",
		-- Function 2
		lda & r3 & ram,
		x"06",
		jmp & x"0",
		x"1C",
		ret & x"0",
		-- Safety Return to the start of the Program
		jmp & x"0",
		x"08",
		others => x"00");
	
begin	
	dout <= progmem(to_integer(prog_adr));
	next_dout <= progmem(to_integer(prog_adr)+1);
	ram_dout <= datamem(to_integer(ram_adr));
	
	process(clk)
	begin
		if1:if(rising_edge(clk)) then
			if2:if(we = '1') then
				datamem(to_integer(ram_adr)) <= din;
			end if if2;
		end if if1;
	end process;
end Malibu;