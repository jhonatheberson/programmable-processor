library ieee;
use ieee.std_logic_1164.all;

entity multiplexador is
port
	(
		X0, X1, X2, X3, X4 	: in std_logic_vector(7 downto 0);
		S					   	: in std_logic_vector(2 downto 0);
		L 							: in std_logic;
		Y							: out std_logic_vector(7 downto 0)
	);
end multiplexador;

architecture archMultiplexador of multiplexador is
signal ylinha : std_logic_vector(7 downto 0);
begin
	ylinha <= (X0 and not(S(2)) and not(S(1)) and not(S(2))) or
				 (X1 and not(S(2)) and not(S(1)) and (s(2))) or
				 (X2 and not(S(2)) and (S(1)) and not(S(0))) or
				 (X3 and not(S(1)) and (S(1)) and (S(0))) or
				 (X4 and (S(2)) and  not(S(1)) and not(S(0)));
	Y <= ylinha and L;
end archMultiplexador;