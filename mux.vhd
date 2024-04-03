library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux is
	generic(
		nbits : integer := 4
	);
	port(
		in_a, in_b : in std_logic_vector(nbits-1 downto 0);
		sel : in std_logic;
		resultado : out std_logic_vector(nbits-1 downto 0)
	);
end mux;
 
architecture comportamento of mux is
begin
	resultado <= in_a when sel='0' else in_b;
end comportamento;