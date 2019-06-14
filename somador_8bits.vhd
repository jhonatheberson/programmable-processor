--libraries to be used are specified here
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
 
--entity declaration with port definitions
entity somador_8bits is
port(
	busX, busY: in std_logic_vector(7 downto 0);
	Cin : in std_logic; 
	busS  : out std_logic_vector(7 downto 0);
	overflow:  out std_logic 
);
end somador_8bits;


architecture behavioral of somador_8bits is

component somador_4bits is
port(
	a, b, Cin : in std_logic;  --4 bit input 1
	s  : out std_logic;   -- 4 bit s
	Cout:  out std_logic   -- c4 out.
);
end component;
signal C0, C1, C2, C3, C4, C5, C6, C7 : std_logic;

begin
b0 : somador_4bits port map(busX(0), BusY(0), Cin, BusS(0), C0);
b1 : somador_4bits port map(busX(1), BusY(1), C0, BusS(1), C1);
b2 : somador_4bits port map(busX(2), BusY(2), C1, BusS(2), C2);
b3 : somador_4bits port map(busX(3), BusY(3), C2, BusS(3), C3);
b4 : somador_4bits port map(busX(4), BusY(4), C3, BusS(4), C4);
b5 : somador_4bits port map(busX(5), BusY(5), C4, BusS(5), C5);
b6 : somador_4bits port map(busX(6), BusY(6), C5, BusS(6), C6);
b7 : somador_4bits port map(busX(7), BusY(7), C6, BusS(7), C7);
overflow <= C6 xor C7;



end behavioral;