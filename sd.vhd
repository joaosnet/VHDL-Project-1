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
	generic(
		nbits : integer := 4 -- Parâmetro genérico nbits com valor padrão 4
	);
    port(
        in_a, in_b : in std_logic_vector(31 downto 0);
        sel : in std_logic_vector(3 downto 0);
        S : out std_logic_vector(31 downto 0)
    );
end sd;

architecture comportamento of sd is
    component Soma
        generic(
            nbits : integer := 4 -- Parâmetro genérico nbits com valor padrão 4
        );
        Port ( A : in  STD_LOGIC_VECTOR (nbits-1 downto 0);
               B : in  STD_LOGIC_VECTOR (nbits-1 downto 0);
               sel : in  STD_LOGIC_VECTOR (3 downto 0);
               S : out  STD_LOGIC_VECTOR (nbits-1 downto 0));
    end component;

    component Subtracao
        generic(
            nbits : integer := 4 -- Parâmetro genérico nbits com valor padrão 4
        );
        Port ( A : in  STD_LOGIC_VECTOR (nbits-1 downto 0);
               B : in  STD_LOGIC_VECTOR (nbits-1 downto 0);
               sel : in  STD_LOGIC_VECTOR (3 downto 0);
               S : out  STD_LOGIC_VECTOR (nbits-1 downto 0));
    end component;

    component andlogic
        generic(
            nbits : integer := 4 -- Parâmetro genérico nbits com valor padrão 4
        );
        Port ( A : in  STD_LOGIC_VECTOR (nbits-1 downto 0);
               B : in  STD_LOGIC_VECTOR (nbits-1 downto 0);
               sel : in  STD_LOGIC_VECTOR (3 downto 0);
               S : out  STD_LOGIC_VECTOR (nbits-1 downto 0));
    end component;

    component orlogic
        generic(
            nbits : integer := 4 -- Parâmetro genérico nbits com valor padrão 4
        );
        Port ( A : in  STD_LOGIC_VECTOR (nbits-1 downto 0);
               B : in  STD_LOGIC_VECTOR (nbits-1 downto 0);
               sel : in  STD_LOGIC_VECTOR (3 downto 0);
               S : out  STD_LOGIC_VECTOR (nbits-1 downto 0));
    end component;

    component nota
        generic(
            nbits : integer := 4
        );
        port(
            A : in std_logic_vector(nbits-1 downto 0);
            sel : in std_logic_vector(3 downto 0);
            S : out std_logic_vector(nbits-1 downto 0)
        );
    end component;

    component notb
        generic(
            nbits : integer := 4 -- Parâmetro genérico que define o número de bits
        );
        port(
            B : in std_logic_vector(nbits-1 downto 0); -- Portas de entrada op_a e B do tipo std_logic_vector
            sel : in std_logic_vector(3 downto 0); -- Porta de entrada sel do tipo std_logic_vector
            S : out std_logic_vector(nbits-1 downto 0) -- Porta de saída S do tipo std_logic_vector
        );
    end component;

    component ShiftLeft
        generic(
            nbits : integer := 4 -- Parâmetro genérico nbits com valor padrão 4
        );
        Port ( A : in  STD_LOGIC_VECTOR (nbits-1 downto 0);
               sel : in  STD_LOGIC_VECTOR (3 downto 0);
               S : out  STD_LOGIC_VECTOR (nbits-1 downto 0));
    end component;

    component ShiftRight
        generic(
            nbits : integer := 4 -- Parâmetro genérico nbits com valor padrão 4
        );
        Port ( A : in  STD_LOGIC_VECTOR (nbits-1 downto 0);
               sel : in  STD_LOGIC_VECTOR (3 downto 0);
               S : out  STD_LOGIC_VECTOR (nbits-1 downto 0));
    end component;

    component NmaisUm
        generic(
            nbits : integer := 4 -- Parâmetro genérico nbits com valor padrão 4
        );
        Port ( A : in  STD_LOGIC_VECTOR (nbits-1 downto 0);
               sel : in  STD_LOGIC_VECTOR (3 downto 0);
               S : out  STD_LOGIC_VECTOR (nbits-1 downto 0));
    end component;

    component NmenosUm
        generic(
            nbits : integer := 4 -- Parâmetro genérico nbits com valor padrão 4
        );
        Port ( A : in  STD_LOGIC_VECTOR (nbits-1 downto 0);
               sel : in  STD_LOGIC_VECTOR (3 downto 0);
               S : out  STD_LOGIC_VECTOR (nbits-1 downto 0));
    end component;

    constant nbits_config : integer := 32; -- Constante nbits_config do tipo integer com valor 32

    signal res : std_logic_vector(nbits_config-1 downto 0);
    signal res_soma, res_subtracao, res_and, res_or, res_notA, res_notB, res_shiftLeft, res_shiftRight, res_nmaisum, res_nmenosum : std_logic_vector(nbits_config-1 downto 0);


begin
    inst_soma : soma
    generic map(
        nbits => nbits_config
    )
    port map(
        A => in_a, 
        B => in_b, 
        sel => sel, 
        S => res_soma
    );
    inst_subtracao : subtracao 
    generic map(
        nbits => nbits_config
    )
    port map(A => in_a, B => in_b, sel => sel, S => res_subtracao);
    inst_and : andlogic 
    generic map(
        nbits => nbits_config
    )
    port map(A => in_a, B => in_b, sel => sel, S => res_and);
    inst_or : orlogic
    generic map(
        nbits => nbits_config
    ) 
    port map(A => in_a, B => in_b, sel => sel, S => res_or);
    inst_notA : nota 
    generic map(
        nbits => nbits_config
    )
    port map(A => in_a, sel => sel, S => res_notA);
    inst_notB : notb 
    generic map(
        nbits => nbits_config
    )
    port map(B => in_b, sel => sel, S => res_notB);
    inst_shiftLeft : shiftleft 
    generic map(
        nbits => nbits_config
    )
    port map(A => in_a, sel => sel, S => res_shiftLeft);
    inst_shiftRight : shiftright 
    generic map(
        nbits => nbits_config
    )
    port map(A => in_a, sel => sel, S => res_shiftRight);
    inst_nmaisum : nmaisum 
    generic map(
        nbits => nbits_config
    )
    port map(A => in_a, sel => sel, S => res_nmaisum);
    inst_nmenosum : nmenosum 
    generic map(
        nbits => nbits_config
    )
    port map(A => in_a, sel => sel, S => res_nmenosum);

    process(sel, res_soma, res_subtracao, res_and, res_or, res_notA, res_notB, res_shiftLeft, res_shiftRight, res_nmaisum, res_nmenosum)
    begin
        case sel is
            when "0000" =>
                S <= res_soma;
            when "0001" =>
                S <= res_subtracao;
            when "0010" =>
                S <= res_and;
            when "0011" =>
                S <= res_or;
            when "0100" =>
                S <= res_notA;
            when "0101" =>
                S <= res_notB;
            when "0110" =>
                S <= res_shiftLeft;
            when "0111" =>
                S <= res_shiftRight;
            when "1000" =>
                S <= res_nmaisum;
            when "1001" =>
                S <= res_nmenosum;
            when others =>
                S <= (others => '0');
        end case;
    end process;
end comportamento;