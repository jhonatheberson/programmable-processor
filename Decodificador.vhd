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
  
    saida_dec <= "0000000000" WHEN "0000", -- NOP     - nenhuma operacao
                 "0000000001" WHEN "0001", -- STA end - armazena acumulador(store)
                 "0000000010" WHEN "0010", -- LDA end - carrega acumulador (load) 
                 "0000000100" WHEN "0011", -- ADD end - Soma
                 "0000001000" WHEN "0100", -- OR end  - ou logico
                 "0000010000" WHEN "0101", -- AND end - e logico
                 "0000100000" WHEN "0110", -- NOT     - inverte(complementa) acumulador
                 "0001000000" WHEN "1000", -- JMP end - desvio incodicional - (jump)
                 "0010000000" WHEN "1001", -- JN end  - desvio condicional  - (jump on negative)
                 "0100000000" WHEN "1010", -- JZ end  - desvio condicional  - (jump on zero)
                 "1000000000" WHEN "1111", -- HLT     - termino de execucao - (halt)
		 "1111111111" WHEN OTHERS;
end archDec;
