library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;
library work;
use work.INSTRUCTS.all;

entity ALU is
	port(
		clk: in std_logic;
		op, a, b: in unsigned(7 downto 0) := (others => '0');
		result: out unsigned(7 downto 0) := (others => '0');
		carry, zero, negat: out std_logic := '0'
	);
end ALU;

architecture Malibu of ALU is
	signal acu: unsigned(8 downto 0) := (others => '0');
begin	
	-- Handle Arithmetic & Logical operations
	process(clk)
	begin
		if(rising_edge(clk)) then
			case op(7 downto 4) is
				when add =>
					acu <= resize(a, 9) + b;
				when sbt =>
					acu <= resize(a, 9) - b;
				when anda =>
					acu <= resize(a and b, 9);
				when ora =>
					acu <= resize(a or b, 9);
				when xora =>
					acu <= resize(a xor b, 9);
				when slla =>
					acu <= resize(a sll to_integer(b), 9);
				when srla =>
					acu <= resize(a srl to_integer(b), 9);
				when neg =>
					acu <= resize(not a, 9);
				when others =>
					null;
			end case;
		end if;
	end process;
	
--	with op(7 downto 4) select acu <=
--		resize(a, 9) + b when add,
--		resize(a, 9) - b when sbt,
--		resize(a and b, 9) when anda,
--		resize(a or b, 9) when ora,
--		resize(a xor b, 9) when xora,
--		resize(a sll to_integer(b), 9) when slla,
--		resize(a srl to_integer(b), 9) when srla,
--		resize(not a, 9) when neg,
--		acu when others;
	
	result <= acu(7 downto 0);
	carry <= acu(8);
	negat <= '0';
	zero <= '1' when acu = "000000000" else '0';
		
end Malibu;