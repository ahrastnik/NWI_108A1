library IEEE;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;

package INSTRUCTS is
	subtype instruct is unsigned(3 downto 0);
	subtype reg is unsigned(1 downto 0);
	subtype strType is unsigned(1 downto 0);
	-- Managment
	-- 1 cycle
	constant nop: instruct := 	"0000"; -- No OPeration
	constant ret: instruct 	:= "0001"; -- Return from Function or Interrupt
	constant copy:	instruct := "0010"; -- copy data from register/ Push
	constant jezr:	instruct := "0011"; -- jump if equals zero - relative/ Pop
	-- 2 cycles
	constant lda: instruct := 	"0100"; -- load from RAM
	constant sta: instruct := 	"0101"; -- store to RAM
	constant jmp: instruct := 	"0110"; -- jump to location
	constant call: instruct := "0111"; -- call function
	
	-- Arithmetic/Logical
	constant add: instruct := 	"1000"; -- add
	constant sbt: instruct := 	"1001"; -- subtract
	constant anda: instruct := "1010"; -- and
	constant ora: instruct := 	"1011"; -- or
	constant xora: instruct := "1100"; -- Xor
	constant slla: instruct := "1101"; -- shift left
	constant srla: instruct := "1110"; -- shift right
	constant neg: instruct := 	"1111"; -- negate
	
	-- REGISTERS
	constant r0: reg := "00";
	constant r1: reg := "01";
	constant r2: reg := "10";
	constant r3: reg := "11";
	
	-- Storage Type
	constant prog: strType := "00";
	constant ram: strType := "01";
	
end INSTRUCTS;