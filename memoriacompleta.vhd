library ieee;
use ieee.std_logic_1164.all;

entity memoriacompleta is

port(
        E  : in std_logic_vector(7 downto 0);
		  reset : in std_logic;
        Ad   : in std_logic_vector(3 downto 0) ;
        rw  : in std_logic;
        clk : in std_logic;
        S     : out std_logic_vector(7 downto 0)
    );
end memoriacompleta;
architecture archMemoria of memoriacompleta is
component celulamemoria is
port(
        E  : in std_logic_vector(7 downto 0);
		  reset : in std_logic;
        en   : in std_logic ;
        rw  : in std_logic;
        clk : in std_logic;
        S     : out std_logic_vector(7 downto 0)
    );
end component;
signal Aux : std_logic_vector(7 downto 0);
signal enS: std_logic_vector(15 downto 0);
signal Saux0,Saux1,Saux2,Saux3,Saux4,Saux5,Saux6,Saux7,Saux8,Saux9,Saux10,Saux11,Saux12,Saux13,Saux14,Saux15 : std_logic_vector(7 downto 0);
begin
        enS(0)<= not(Ad(3)) and not(Ad(2)) and not (Ad(1)) and not(Ad(0));
		  enS(1)<= not(Ad(3)) and not(Ad(2)) and not (Ad(1)) and (Ad(0));
		  enS(2)<= not(Ad(3)) and not(Ad(2)) and (Ad(1)) and not(Ad(0));
		  enS(3)<= not(Ad(3)) and not(Ad(2)) and (Ad(1)) and (Ad(0));
		  enS(4)<= not(Ad(3)) and (Ad(2)) and not (Ad(1)) and not(Ad(0));
		  enS(5)<= not(Ad(3)) and (Ad(2)) and not (Ad(1)) and (Ad(0));
		  enS(6)<= not(Ad(3)) and (Ad(2)) and (Ad(1)) and not(Ad(0));
		  enS(7)<= not(Ad(3)) and (Ad(2)) and (Ad(1)) and (Ad(0));
		  enS(8)<= (Ad(3)) and not(Ad(2)) and not (Ad(1)) and not(Ad(0));
		  enS(9)<= (Ad(3)) and not(Ad(2)) and not (Ad(1)) and (Ad(0));
		  enS(10)<= (Ad(3)) and not(Ad(2)) and (Ad(1)) and not(Ad(0));
		  enS(11)<= (Ad(3)) and not(Ad(2)) and (Ad(1)) and (Ad(0));
		  enS(12)<= (Ad(3)) and (Ad(2)) and not (Ad(1)) and not(Ad(0));
		  enS(13)<= (Ad(3)) and (Ad(2)) and not (Ad(1)) and (Ad(0));
		  enS(14)<= (Ad(3)) and (Ad(2)) and (Ad(1)) and not(Ad(0));
		  enS(15)<= (Ad(3)) and (Ad(2)) and (Ad(1)) and (Ad(0));
			    cont0 : celulamemoria port map(E,reset,enS(0) ,rw or not(enS(0)),clk and rw,Saux0);
             cont1 : celulamemoria port map(E,reset,enS(1) ,rw or not(enS(1)),clk and rw,Saux1);
				 cont2 : celulamemoria port map(E,reset,enS(2) ,rw or not(enS(2)),clk and rw,Saux2);
				 cont3 : celulamemoria port map(E,reset,enS(3) ,rw or not(enS(3)),clk and rw,Saux3);
				 cont4 : celulamemoria port map(E,reset,enS(4) ,rw or not(enS(4)),clk and rw,Saux4);
				 cont5 : celulamemoria port map(E,reset,enS(5) ,rw or not(enS(5)),clk and rw,Saux5);
				 cont6 : celulamemoria port map(E,reset,enS(6) ,rw or not(enS(6)),clk and rw,Saux6);
				 cont7 : celulamemoria port map(E,reset,enS(7) ,rw or not(enS(7)),clk and rw,Saux7);
				 cont8 : celulamemoria port map(E,reset,enS(8) ,rw or not(enS(8)),clk and rw,Saux8);
				 cont9 : celulamemoria port map(E,reset,enS(9) ,rw or not(enS(9)),clk and rw,Saux9);
				 cont10 : celulamemoria port map(E,reset,enS(10) ,rw or not(enS(10)),clk and rw,Saux10);
				 cont11 : celulamemoria port map(E,reset,enS(11) ,rw or not(enS(11)),clk and rw,Saux11);
				 cont12 : celulamemoria port map(E,reset,enS(12) ,rw or not(enS(12)),clk and rw,Saux12);
				 cont13 : celulamemoria port map(E,reset,enS(13) ,rw or not(enS(13)),clk and rw,Saux13);
				 cont14 : celulamemoria port map(E,reset,enS(14) ,rw or not(enS(14)),clk and rw,Saux14);
				 cont15 : celulamemoria port map(E,reset,enS(15) ,rw or not(enS(15)),clk and rw,Saux15);
			Aux<= (Saux0 or Saux1 or Saux2 or Saux3 or Saux4 or Saux5 or Saux6 or Saux7 or Saux8 or Saux9 or Saux10 or Saux11 or Saux12 or Saux13 or Saux14 or Saux15);
			FOR01 : for i in 0 to 7 generate
				S(i) <= Aux(i) and not(rw);
			end generate;
end archMemoria;
