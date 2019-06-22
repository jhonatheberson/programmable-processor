library ieee;
use ieee.std_logic_1164.all;

entity rdm is
    port(
		clk			: in std_logic;
		cargaRDM		: in std_logic;
		reset			: in std_logic;
		keyMemAc		: in std_logic_vector (1 downto 0);
      Entrada_Mem	: in std_logic_vector (7 downto 0);
      Entrada_Ac	: in std_logic_vector (7 downto 0);
		Entrada     : in std_logic_vector (7 downto 0):="00000000";
		saida			: out std_logic_vector(7 downto 0));
end rdm;

architecture archRDM of rdm is 

component registrador8 is
port(
		Ip  	: in std_logic_vector(7 downto 0);
		selCP	: in std_logic ;
		Ii  	: in std_logic_vector(7 downto 0);
		clk 	: in std_logic;
		Qs	 	: out std_logic_vector(7 downto 0)
	);
end component;
 
signal sinal : std_logic_vector (7 downto 0);	

begin

		WITH keyMemAc SELECT
		
			sinal <= Entrada_Mem  WHEN "00";
						Entrada_Ac   WHEN "01";
						Entrada 		 WHEN OTHERS;
						
		A: registrador8 port map(sinal,cargaRDM,clk,saida);
		  
end archRDM;