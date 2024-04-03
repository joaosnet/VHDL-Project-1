library IEEE; -- Biblioteca padrão do VHDL
use ieee.std_logic_1164.all; -- Pacote que define o tipo de dados std_logic e suas operações
use ieee.numeric_std.all; -- Pacote que define funções e operações para tipos de dados numéricos

entity mux is -- Declaração da entidade "mux"
	generic(
		nbits : integer := 4 -- Parâmetro genérico que define o número de bits
	);
	port(
		in_a, in_b : in std_logic_vector(nbits-1 downto 0); -- Portas de entrada in_a e in_b do tipo std_logic_vector com tamanho nbits-1 downto 0
		sel : in std_logic; -- Porta de entrada sel do tipo std_logic
		resultado : out std_logic_vector(nbits-1 downto 0) -- Porta de saída resultado do tipo std_logic_vector com tamanho nbits-1 downto 0
	);
end mux;
 
architecture comportamento of mux is -- Declaração da arquitetura "comportamento" para a entidade "mux"
begin
	resultado <= in_a when sel='0' else in_b; -- Atribuição condicional do valor de in_a ou in_b para a porta de saída resultado, dependendo do valor de sel
end comportamento;