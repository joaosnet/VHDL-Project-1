library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shift is
	generic(
		nbits : integer := 4;
		shift : integer := 4;
		shift_config : string := "esquerda" --"esquerda" ou "direita"
	);
	port(
		op_a : in std_logic_vector(nbits-1 downto 0);
		resultado : out std_logic_vector(nbits-1 downto 0)
	);
end shift;

architecture comportamento of shift is
begin

IMPLEMENTACAO_SHIFT_LEFT: if shift_config = "esquerda" generate
	resultado <= std_logic_vector(shift_left(unsigned(op_a), shift));
end generate IMPLEMENTACAO_SHIFT_LEFT;

IMPLEMENTACAO_SHIFT_RIGHT: if shift_config = "direita" generate
	resultado <= std_logic_vector(shift_right(unsigned(op_a), shift));
end generate IMPLEMENTACAO_SHIFT_RIGHT;

end comportamento;