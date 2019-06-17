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
architecture archAorB of A_or_B is -- A or B 
begin
S(0) <= ((B(0)) or (A(0))); -- B(0) or A(0)
S(1) <= ((B(1)) or (A(1))); -- B(1) or A(1)
S(2) <= ((B(2)) or (A(2))); -- B(2) or A(2)
S(3) <= ((B(3)) or (A(3))); -- B(3) or A(3)
S(4) <= ((B(4)) or (A(4))); -- B(4) or A(4)
S(5) <= ((B(5)) or (A(5))); -- B(5) or A(5)
S(6) <= ((B(6)) or (A(6))); -- B(6) or A(6)
S(7) <= ((B(7)) or (A(7))); -- B(7) or A(7)
end archAorB;