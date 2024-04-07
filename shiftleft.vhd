-- shiftleft.vhd
library IEEE; -- Biblioteca padrão IEEE para VHDL
use ieee.std_logic_1164.all; -- Pacote que define o tipo de dados std_logic e operações relacionadas
use ieee.numeric_std.all; -- Pacote que define o tipo de dados unsigned e operações relacionadas

entity ShiftLeft is
	generic(
		nbits : integer := 4 -- Parâmetro genérico nbits com valor padrão 4
	);
    Port ( A : in  STD_LOGIC_VECTOR (nbits-1 downto 0);
           sel : in  STD_LOGIC_VECTOR (3 downto 0);
           S : out  STD_LOGIC_VECTOR (nbits-1 downto 0));
end ShiftLeft;

architecture Behavior of ShiftLeft is
    signal shiftleft : STD_LOGIC_VECTOR (nbits-1 downto 0);
begin
    shiftleft <= std_logic_vector(shift_left(unsigned(A), 1));
    S <= shiftleft when sel = "0110";
end Behavior;