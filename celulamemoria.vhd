library ieee;
use ieee.std_logic_1164.all;

entity celulamemoria is

port(
        E  : in std_logic_vector(7 downto 0);
		  reset : in std_logic;
        en   : in std_logic ;
        rw  : in std_logic;
        clk : in std_logic;
        S     : out std_logic_vector(7 downto 0)
    );
end celulamemoria;

architecture archCelula of celulamemoria is
component FlipFlopJK is
port(
        J, K: in std_logic;
        clear : in std_logic;
        preset : in std_logic;
        clk : in std_logic;
        Q, Qbar : out std_logic
    );
end component;
signal Saux : std_logic_vector(7 downto 0);
    
begin
        FOR01 : for i in 0 to 7 generate
             cont1 : FlipFlopJK port map( not(E(i))or not(en), E(i) or not(en), not(reset),'1',clk,Saux(i));
             S(i)<= Saux(i) and not(rw);
             end generate;
end archCelula;
