--libraries to be used are specified here
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
 
--component declaration with port definitions
entity ual is
port(
	setUAL:  in std_logic_vector(2 downto 0);  -- 3 bits input
	X, Y : in std_logic_vector(7 downto 0);    --8 bit input 1
	S  : out std_logic_vector(7 downto 0);     -- 8 bit output
	N , Z: out std_logic
	
);
end ual; 

--architecture of entity
architecture archUAL of ual is
  --temporary signal declarations(for intermediate c4's).
  signal resultadoSoma, resultadoInvert, resultaAandB, resultaAorB  :std_logic_vector(7 downto 0);
 signal coutSoma: std_logic;

--component declaration with port definitions
component multiplexador is
port
	(
		X0, X1, X2, X3, X4 	: in std_logic_vector(7 downto 0);
		S					   	: in std_logic_vector(2 downto 0);
		L 							: in std_logic;
		Y							: out std_logic_vector(7 downto 0)
	);
end component;
 
 component A_and_B is 
port (
	A: in std_logic_vector(7 downto 0); -- vector input
	B: in std_logic_vector(7 downto 0); -- vector input
	S: out std_logic_vector(7 downto 0) -- vector output
	);
end component;
 
--component declaration with port definitions
component A_or_B is 
port (
	A: in std_logic_vector(7 downto 0); -- vector input
	B: in std_logic_vector(7 downto 0); -- vector input
	S: out std_logic_vector(7 downto 0) -- vector output
	);
end component;


component somador_8bits is
port(
	busX, busY: in std_logic_vector(7 downto 0);
	Cin : in std_logic; 
	busS  : out std_logic_vector(7 downto 0);
	overflow:  out std_logic 
);
end component;

-- declaring entity
component inverter is 
port (
	A: in std_logic_vector(7 downto 0); -- vector input
	S: out std_logic_vector(7 downto 0) -- vector output
	);
end component;

begin
		som: somador_8bits port map(X, Y,'0', resultadoSoma, coutSoma);
		inverte: inverter port map(X, resultadoInvert);
		AandB: A_and_B port map(X, Y, resultaAandB);
		AorB: A_or_B port map(X, Y, resultaAorB);
		mux: multiplexador port map(resultadoSoma, resultaAandB,resultaAorB,resultadoInvert,Y,setUAL,'1', S);



end archUAL;

 
 