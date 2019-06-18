
library ieee;
use ieee.std_logic_1164.all;

entity multiplexador8bit is
port
(
	X : in std_logic_vector(7 downto 0);
	Y : in std_logic_vector(7 downto 0);
	L : in std_logic;
	Z : out std_logic_vector(7 downto 0)
);
end multiplexador8bit;

architecture archMultiplexador8bit of multiplexador8bit is
begin
	Z(0) <= (X(0) and not(L)) or (Y(0) and L);
	RFOR: for I in 1 to 7 generate
		Z(I) <= (X(I) and not(L)) or (Y(I) and L);
	end generate RFOR;
end archMultiplexador8bit;
