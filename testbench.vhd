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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity testbench is
end testbench;

architecture test of testbench is
	component sd
		port(
			in_a, in_b : in std_logic_vector(31 downto 0);
			sel : in std_logic_vector(3 downto 0);
			S : out std_logic_vector(31 downto 0)
		);
	end component;

	signal A, B, S : std_logic_vector(31 downto 0);
	signal sel : std_logic_vector(3 downto 0);

	signal clock : std_logic := '0';

begin
	dut: sd
	port map(
		in_a => A,
		in_b => B,
		sel => sel,
		S => S
	);

	process(clock)
		file F: TEXT open READ_MODE is "c:\users\joaod\documents\gitHub\vhdl-project-1\entradas.txt";
		variable L: LINE;
		variable entrada : integer;
	begin
		if rising_edge(clock) then
			if not endfile(F) then
				READLINE(F, L);
				READ(L, entrada);
				A <= std_logic_vector(to_unsigned(entrada, 32));

				READLINE(F, L);
				READ (L, entrada);
				B <= std_logic_vector(to_unsigned(entrada, 32));

				sel <= std_logic_vector(to_unsigned((to_integer(unsigned(sel)) + 1) mod 16, sel'length));
			end if;
		end if;
	end process;

	process(clock)
		file F: TEXT open WRITE_MODE is "c:\users\joaod\documents\gitHub\vhdl-project-1\saida.txt";
		variable L: LINE;
	begin
		if rising_edge(clock) then
			WRITE (L, to_integer(unsigned(S))); -- Escreve o valor inteiro convertido do sinal resultado em L
			WRITE (L, ' '); -- Escreve um espaço em L
			WRITE (L, to_bitvector(sel)); -- Escreve o valor do sinal sel em L
			WRITELINE (F, L); -- Escreve a linha L no arquivo F
		end if;
	end process;

	clock <= not clock after 5 ns;
end test;