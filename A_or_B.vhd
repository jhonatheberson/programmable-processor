library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

-- declaring entity
entity A_or_B is 
port (
	A: in std_logic_vector(7 downto 0); -- vector input
	B: in std_logic_vector(7 downto 0); -- vector input
	S: out std_logic_vector(7 downto 0) -- vector output
	);
end A_or_B;

-- declaring architecture
architecture archAorB of A_or_B is --bitwise inverter
begin
S(0) <= (B(0)) or (A(0)); -- inversing A(0)
S(1) <= (B(1)) or (A(1)); -- inversing A(1)
S(2) <= (B(2)) or (A(2)); -- inversing A(2)
S(3) <= (B(3)) or (A(3)); -- inversing A(3)
S(4) <= (B(4)) or (A(4)); -- inversing A(0)
S(5) <= (B(5)) or (A(5)); -- inversing A(1)
S(6) <= (B(6)) or (A(6)); -- inversing A(2)
S(7) <= (B(7)) or (A(7)); -- inversing A(3)
end archAorB;