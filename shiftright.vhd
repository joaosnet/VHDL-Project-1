-- shiftright.vhd
library IEEE; -- Biblioteca padrão IEEE para VHDL
use ieee.std_logic_1164.all; -- Pacote que define o tipo de dados std_logic e operações relacionadas
use ieee.numeric_std.all; -- Pacote que define o tipo de dados unsigned e operações relacionadas

entity ShiftRight is
    generic(
        nbits : integer := 4 -- Parâmetro genérico nbits com valor padrão 4
    );
    Port ( A : in  STD_LOGIC_VECTOR (nbits-1 downto 0);
           S : out  STD_LOGIC_VECTOR (nbits-1 downto 0));
end ShiftRight;

architecture Behavior of ShiftRight is
    signal shiftright : STD_LOGIC_VECTOR (nbits-1 downto 0);
begin
    shiftright <= std_logic_vector(shift_right(unsigned(A), 1));
    S <= shiftright;
end Behavior;