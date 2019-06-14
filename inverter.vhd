library ieee ;
use ieee.std_logic_1164.all ;
use ieee.std_logic_arith.all ;

-- declaring entity
entity inverter is 
port (
	A: in std_logic_vector(7 downto 0); -- vector input
	S: out std_logic_vector(7 downto 0) -- vector output
	);
end inverter;

-- declaring architecture
architecture Behavior of inverter is --bitwise inverter
begin
S <= not A; -- inversing 

end Behavior ;