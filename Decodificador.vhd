library ieee;
use ieee.std_logic_1164.all;

entity decodificador is
port(
  entrada_dec   : in  std_logic_vector(3 downto 0);
  saida_dec		 : out std_logic_vector(9 downto 0));
end decodificador;
 
architecture archDec of decodificador is
begin
  WITH entrada_dec SELECT
  
    saida_dec <= "0000000000" WHEN "0000",
                 "0000000001" WHEN "0001",
                 "0000000010" WHEN "0010",
                 "0000000100" WHEN "0011",
                 "0000001000" WHEN "0100",
                 "0000010000" WHEN "0101",
                 "0000100000" WHEN "0110",
                 "0001000000" WHEN "0111",
                 "0010000000" WHEN "1000",
                 "0100000000" WHEN "1001",
                 "1000000000" WHEN "1011",
		 "1111111111" WHEN OTHERS;
end archDec;