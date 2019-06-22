library ieee;
use ieee.std_logic_1164.all;

entity registrador8RDM is
port(
		Imem  : in std_logic_vector(7 downto 0);
		Iac  : in std_logic_vector(7 downto 0);
		Load   : in std_logic ;
		SelCP : in std_logic;
		clk : in std_logic;
		Qs	 : out std_logic_vector(7 downto 0)
	);
end registrador8RDM;

architecture archRegistrador8RDM of registrador8RDM is
component memoria8 is
port(
		I   : in std_logic_vector(7 downto 0);
		clk : in std_logic;
		Q   : out std_logic_vector(7 downto 0)
	);
end component;
	signal Ie,Qaux : std_logic_vector(7 downto 0);
begin
	Ie(0) <= (Load and SelCP and Imem(0)) or ( Load and not(SelCP) and Iac(0)) or (not(Load) and Qaux(0));
	Ie(1) <= (Load and SelCP and Imem(1)) or ( Load and not(SelCP) and Iac(1)) or (not(Load) and Qaux(1));
	Ie(2) <= (Load and SelCP and Imem(2)) or ( Load and not(SelCP) and Iac(2)) or (not(Load) and Qaux(2));
	Ie(3) <= (Load and SelCP and Imem(3)) or ( Load and not(SelCP) and Iac(3)) or (not(Load) and Qaux(3));
	Ie(4) <= (Load and SelCP and Imem(4)) or ( Load and not(SelCP) and Iac(4)) or (not(Load) and Qaux(4));
	Ie(5) <= (Load and SelCP and Imem(5)) or ( Load and not(SelCP) and Iac(5)) or (not(Load) and Qaux(5));
	Ie(6) <= (Load and SelCP and Imem(6)) or ( Load and not(SelCP) and Iac(6)) or (not(Load) and Qaux(6));
	Ie(7) <= (Load and SelCP and Imem(7)) or ( Load and not(SelCP) and Iac(7)) or (not(Load) and Qaux(7));
	Q0 : memoria8 port map(Ie,clk, Qaux);
	Qs <= Qaux;
end archRegistrador8RDM;
