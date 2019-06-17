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
	ylinha(0) <= (X0(0) and not(S(2)) and not(S(1)) and not(S(2))) or ---- 
				 (X1(0) and not(S(2)) and not(S(1)) and (s(2))) or
				 (X2(0) and not(S(2)) and (S(1)) and not(S(0))) or
				 (X3(0) and not(S(1)) and (S(1)) and (S(0))) or
				 (X4(0) and (S(2)) and  not(S(1)) and not(S(0)));
				 
	
	RFOR: for I in 1 to 7 generate
	Ylinha(I) <= (X0(I) and not(S(2)) and not(S(1)) and not(S(2))) or ---- 
				 (X1(I) and not(S(2)) and not(S(1)) and (s(2))) or
				 (X2(I) and not(S(2)) and (S(1)) and not(S(0))) or
				 (X3(I) and not(S(1)) and (S(1)) and (S(0))) or
				 (X4(I) and (S(2)) and  not(S(1)) and not(S(0)));
	end generate RFOR;
	Y <= ylinha;
end archMultiplexador;