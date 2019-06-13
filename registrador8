library ieee;
use ieee.std_logic_1164.all;

entity registrador8 is
port(
		Ip  : in std_logic_vector(7 downto 0);
		selCP   : in std_logic ;
		Ii  : in std_logic_vector(7 downto 0);
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
	signal Ie : std_logic_vector(7 downto 0);
begin
	Ie(0) <= (selCP and Ip(0)) or (not(selCP) and Ii(0));
	Ie(1) <= (selCP and Ip(1)) or (not(selCP) and Ii(1));
	Ie(2) <= (selCP and Ip(2)) or (not(selCP) and Ii(2));
	Ie(3) <= (selCP and Ip(3)) or (not(selCP) and Ii(3));
	Ie(4) <= (selCP and Ip(4)) or (not(selCP) and Ii(4));
	Ie(5) <= (selCP and Ip(5)) or (not(selCP) and Ii(5));
	Ie(6) <= (selCP and Ip(6)) or (not(selCP) and Ii(6));
	Ie(7) <= (selCP and Ip(7)) or (not(selCP) and Ii(7));
	Q0 : memoria8 port map(Ie,clk, Qs);
end archRegistrador8;
