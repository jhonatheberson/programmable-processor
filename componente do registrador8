library ieee;
use ieee.std_logic_1164.all;

entity memoria8 is
port(
		I : in std_logic_vector(7 downto 0);
		clk : in std_logic;
		Q : out std_logic_vector(7 downto 0)
	);
end memoria8;

architecture archMemoria8 of memoria8 is
	component FlipFlopJK is
port(
		J, K: in std_logic;
		clear : in std_logic;
		preset : in std_logic;
		clk : in std_logic;
		Q, Qbar : out std_logic
	);
end component;
begin
	Q0 : FlipFlopJK port map(not(I(0)),I(0), '1', '1', clk, Q(0));
   Q1 : FlipFlopJK port map(not(I(1)),I(1), '1', '1', clk, Q(1));
	Q2 : FlipFlopJK port map(not(I(2)),I(2), '1', '1', clk, Q(2));
	Q3 : FlipFlopJK port map(not(I(3)),I(3), '1', '1', clk, Q(3));
	Q4 : FlipFlopJK port map(not(I(4)),I(4), '1', '1', clk, Q(4));
	Q5 : FlipFlopJK port map(not(I(5)),I(5), '1', '1', clk, Q(5));
	Q6 : FlipFlopJK port map(not(I(6)),I(6), '1', '1', clk, Q(6));
	Q7 : FlipFlopJK port map(not(I(7)),I(7), '1', '1', clk, Q(7));
end archMemoria8;
