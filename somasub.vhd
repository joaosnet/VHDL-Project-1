library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity somasub is
	generic(
		nbits : integer := 4
	);
	port(
		op_a, op_b : in std_logic_vector(nbits-1 downto 0);
		sel : in std_logic;
		resultado : out std_logic_vector(nbits-1 downto 0)
	);
end somasub;

architecture comportamento of somasub is
	signal soma, sub : std_logic_vector(nbits-1 downto 0);
begin
	soma <= std_logic_vector(unsigned(op_a) + unsigned(op_b));
	sub <= std_logic_vector(unsigned(op_a) - unsigned(op_b));
	resultado <= soma when sel='0' else sub;
end comportamento;