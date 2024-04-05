-- shiftright.vhd
library IEEE; -- Biblioteca padrão IEEE para VHDL
use ieee.std_logic_1164.all; -- Pacote que define o tipo de dados std_logic e operações relacionadas
use ieee.numeric_std.all; -- Pacote que define o tipo de dados unsigned e operações relacionadas

entity ShiftRight is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           Resultado : out  STD_LOGIC_VECTOR (31 downto 0));
end ShiftRight;

architecture Behavior of ShiftRight is
begin
    Resultado <= std_logic_vector(shift_right(unsigned(A), 1));
end Behavior;