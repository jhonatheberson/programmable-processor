library ieee;
use ieee.std_logic_1164.all;

entity registrador8 is
port(
		Ip  : in std_logic_vector(7 downto 0);
		Load   : in std_logic ;
		clk : in std_logic;
		Qs	 : out std_logic_vector(7 downto 0)
	);
end registrador8;

architecture archRegistrador8 of registrador8 is
component memoria8 is
port(
		I   : in std_logic_vector(7 downto 0);
		clk : in std_logic;
		Q   : out std_logic_vector(7 downto 0)
	);
end component;
	signal Ie,Qaux : std_logic_vector(7 downto 0);
begin
	Ie(0) <= (Load and Ip(0)) or (not(Load) and Qaux(0));
	Ie(1) <= (Load and Ip(1)) or (not(Load) and Qaux(1));
	Ie(2) <= (Load and Ip(2)) or (not(Load) and Qaux(2));
	Ie(3) <= (Load and Ip(3)) or (not(Load) and Qaux(3));
	Ie(4) <= (Load and Ip(4)) or (not(Load) and Qaux(4));
	Ie(5) <= (Load and Ip(5)) or (not(Load) and Qaux(5));
	Ie(6) <= (Load and Ip(6)) or (not(Load) and Qaux(6));
	Ie(7) <= (Load and Ip(7)) or (not(Load) and Qaux(7));
	Q0 : memoria8 port map(Ie,clk, Qaux);
	Qs <= Qaux;
end archRegistrador8;
