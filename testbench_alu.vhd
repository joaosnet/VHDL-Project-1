-- UNIDADE LÓGICA E ARITMÉTICA (ALU) EM VHDL

-- Tabela verde para seleção de operações da ALU

-- sel3 sel2 sel1 sel0  | operação              [A0..A3] [B0..B3]
-- --------------------------------                     _______   ______
--    0    0    0    1  | A + B                         \      \ /     /
--    0    0    1    0  | A - B             [s0..s3]     \      ALU   /
--    0    0    1    1  | A and B                         \__________/
--    0    1    0    0  | A or B
--    0    1    0    1  | not A
--    0    1    1    0  | not b
--    0    1    1    1  | << (shift left)
--    1    0    0    0  | >> (shift right)
--    1    0    0    1  | n + 1
--    1    0    1    0  | n - 1

-- Autor: João da Cruz de Nativiade e Silva Neto
-- Data: 04/04/2024

-- Curso: Engenharia de Computação
-- Disciplina: Projetos de Hardware e Interfaceamento


library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_unsigned.ALL;

entity alu is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           sel : in  STD_LOGIC_VECTOR (3 downto 0);
           S : out  STD_LOGIC_VECTOR (3 downto 0);
           Cout : out  STD_LOGIC);
end alu;

architecture Behavioral of alu is
begin
    process(A, B, sel)
    begin
        case sel is
            when "0001" => S <= A + B;
            when "0010" => S <= A - B;
            when "0011" => S <= A and B;
            when "0100" => S <= A or B;
            when "0101" => S <= not A;
            when "0110" => S <= not B;
            when "0111" => S <= A sll 1;
            when "1000" => S <= A srl 1;
            when "1001" => S <= A + 1;
            when "1010" => S <= A - 1;
        end case;
    end process;
    Cout <= '0';
end Behavioral;