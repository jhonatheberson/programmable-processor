library ieee;
use ieee.std_logic_1164.all;

entity pc is
port(
		jumpto  : in std_logic_vector(7 downto 0);
		Load : in std_logic;
		incrementar : in std_logic;
		clk : in std_logic;
		Qs	 : out std_logic_vector(7 downto 0)
	);
end pc;

architecture archPc of pc is
component memoria8 is
port(
		I   : in std_logic_vector(7 downto 0);
		clk : in std_logic;
		Q   : out std_logic_vector(7 downto 0)
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
	signal X,Y,Qaux,Ie : std_logic_vector(7 downto 0);
	signal X1 : std_logic_vector(7 downto 0) := "00000001";
	signal Y0 : std_logic_vector(7 downto 0) := "00000000";
begin
	RFOR: for I in 0 to 7 generate
		X(i) <= (jumpto(i) and Load and not(incrementar)) or (X1(i) and not (load) and incrementar) or (not(Load) and not(incrementar) and Y0(i)) or ( Load and incrementar and jumpto(i));
		Y(i) <= (Qaux(i) and incrementar and not(load)) or (Y0(i) and not(incrementar) and Load) or (Qaux(i) and not(incrementar) and not(Load)) or ( Load and incrementar and Y0(i));
	end generate RFOR;
	S0 : somador_8bits port map(X,Y,'0',Ie);
	Q0 : memoria8 port map(Ie,clk, Qaux);
	Qs <= Qaux;
end archPc;

	