-- UNIDADE LÓGICA E ARITMÉTICA (ALU) EM VHDL

-- Tabela verde para seleção de operações da ALU

-- sel3 sel2 sel1 sel0  | operação              [A0..A3] [B0..B3]
-- --------------------------------                     _______   ______
--    0    0    0    0  | A + B                         \      \ /     /
--    0    0    0    1  | A - B             [s0..s3]     \      ALU   /
--    0    0    1    0  | A and B                         \__________/
--    0    0    1    1  | A or B
--    0    1    0    0  | not A
--    0    1    0    1  | not b
--    0    1    1    0  | << (shift left)
--    0    1    1    1  | >> (shift right)
--    1    0    0    0  | n + 1
--    1    0    0    1  | n - 1

-- Autor: João da Cruz de Nativiade e Silva Neto
-- Data: 04/04/2024

-- Curso: Engenharia de Computação
-- Disciplina: Projetos de Hardware e Interfaceamento

library IEEE;
library work;
use IEEE.STD_LOGIC_1164.ALL;

entity sd is
    port(
        in_a, in_b, in_c : in std_logic_vector(31 downto 0);
        sel : in std_logic_vector(3 downto 0);
        resultado : out std_logic_vector(31 downto 0)
    );
end sd;

architecture comportamento of sd is
    component Soma
        port(
            A, B : in std_logic_vector(31 downto 0);
            Resultado : out std_logic_vector(31 downto 0)
        );
    end component;

    component Subtracao
        port(
            A, B : in std_logic_vector(31 downto 0);
            Resultado : out std_logic_vector(31 downto 0)
        );
    end component;

    component And_Logic
        port(
            A, B : in std_logic_vector(31 downto 0);
            Resultado : out std_logic_vector(31 downto 0)
        );
    end component;

    component Or_Logic
        port(
            A, B : in std_logic_vector(31 downto 0);
            Resultado : out std_logic_vector(31 downto 0)
        );
    end component;

    component not_a
        port(
            A : in std_logic_vector(31 downto 0);
            Resultado : out std_logic_vector(31 downto 0)
        );
    end component;

    component not_b
        port(
            B : in std_logic_vector(31 downto 0);
            Resultado : out std_logic_vector(31 downto 0)
        );
    end component;

    component ShiftLeft
        port(
            A : in std_logic_vector(31 downto 0);
            Resultado : out std_logic_vector(31 downto 0)
        );
    end component;

    component ShiftRight
        port(
            A : in std_logic_vector(31 downto 0);
            Resultado : out std_logic_vector(31 downto 0)
        );
    end component;

    component NmaisUm
        port(
            A : in std_logic_vector(31 downto 0);
            Resultado : out std_logic_vector(31 downto 0)
        );
    end component;

    component NmenosUm
        port(
            A : in std_logic_vector(31 downto 0);
            Resultado : out std_logic_vector(31 downto 0)
        );
    end component;

    signal res : std_logic_vector(31 downto 0);


begin
    inst_soma : soma port map(A => in_a, B => in_b, Resultado => res);
    inst_subtracao : subtracao port map(A => in_a, B => in_b, Resultado => res);
    inst_and : and_logic port map(A => in_a, B => in_b, Resultado => res);
    inst_or : or_logic port map(A => in_a, B => in_b, Resultado => res);
    inst_notA : not_a port map(A => in_a, Resultado => res);
    inst_notB : not_b port map(B => in_b, Resultado => res);
    inst_shiftLeft : shiftleft port map(A => in_a, Resultado => res);
    inst_shiftRight : shiftright port map(A => in_a, Resultado => res);
    inst_nmaisum : nmaisum port map(A => in_a, Resultado => res);
    inst_nmenosum : nmenosum port map(A => in_a, Resultado => res);
    process(sel)
    begin
        case sel is
            when "0000" =>
                res <= inst_soma.Resultado;
            when "0001" =>
                res <= inst_subtracao.Resultado;
            when "0010" =>
                res <= inst_and.Resultado;
            when "0011" =>
                res <= inst_or.Resultado;
            when "0100" =>
                res <= inst_notA.Resultado;
            when "0101" =>
                res <= inst_notB.Resultado;
            when "0110" =>
                res <= inst_shiftLeft.Resultado;
            when "0111" =>
                res <= inst_shiftRight.Resultado;
            when "1000" =>
                res <= inst_nmaisum.Resultado;
            when "1001" =>
                res <= inst_nmenosum.Resultado;
            when others =>
                res <= (others => '0');
        end case;
    end process;

    resultado <= res;
end comportamento;