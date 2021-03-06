library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

-- declaring entity
entity A_and_B is 
port (
	A: in std_logic_vector(7 downto 0); -- vector input
	B: in std_logic_vector(7 downto 0); -- vector input
	S: out std_logic_vector(7 downto 0) -- vector output
	);
end A_and_B;

-- declaring architecture
architecture archAandB of A_and_B is -- A and B 
begin
S(0) <= ((B(0)) and (A(0))); -- B(0) and A(0)
S(1) <= ((B(1)) and (A(1))); -- B(1) and A(1)
S(2) <= ((B(2)) and (A(2))); -- B(2) and A(2)
S(3) <= ((B(3)) and (A(3))); -- B(3) and A(3)
S(4) <= ((B(4)) and (A(4))); -- B(4) and A(4)
S(5) <= ((B(5)) and (A(5))); -- B(5) and A(5)
S(6) <= ((B(6)) and (A(6))); -- B(6) and A(6)
S(7) <= ((B(7)) and (A(7))); -- B(7) and A(7)
end archAandB;