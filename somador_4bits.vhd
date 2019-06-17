--libraries to be used are specified here
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
 
--entity declaration with port definitions
entity somador_4bits is
port(
	a, b, Cin : in std_logic;  --4 bit input 1
	s  : out std_logic;   -- 4 bit s
	Cout:  out std_logic   -- c4 out.
);
end somador_4bits;
 
--architecture of entity
architecture Behavioral of somador_4bits is
 
begin  
 
 s <= (a xor b xor Cin);
 Cout <= (a and b) or (a and Cin) or (b and Cin);
 
end Behavioral;