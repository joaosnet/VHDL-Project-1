library IEEE; -- Biblioteca padrão IEEE para VHDL
use ieee.std_logic_1164.all; -- Pacote que define o tipo de dados std_logic e operações relacionadas
use ieee.numeric_std.all; -- Pacote que define o tipo de dados unsigned e operações relacionadas

entity somasub is -- Declaração da entidade somasub
	generic(
		nbits : integer := 4 -- Parâmetro genérico que define o número de bits
	);
	port(
		op_a, op_b : in std_logic_vector(nbits-1 downto 0); -- Portas de entrada op_a e op_b do tipo std_logic_vector
		sel : in std_logic; -- Porta de entrada sel do tipo std_logic
		resultado : out std_logic_vector(nbits-1 downto 0) -- Porta de saída resultado do tipo std_logic_vector
	);
end somasub;

architecture comportamento of somasub is -- Declaração da arquitetura comportamento para a entidade somasub
	signal soma, sub : std_logic_vector(nbits-1 downto 0); -- Declaração dos sinais soma e sub do tipo std_logic_vector
begin
	soma <= std_logic_vector(unsigned(op_a) + unsigned(op_b)); -- Soma dos valores de op_a e op_b convertidos para unsigned e depois convertidos para std_logic_vector
	sub <= std_logic_vector(unsigned(op_a) - unsigned(op_b)); -- Subtração dos valores de op_a e op_b convertidos para unsigned e depois convertidos para std_logic_vector
	resultado <= soma when sel='0' else sub; -- Atribuição do valor de soma para resultado quando sel é '0', caso contrário, atribui o valor de sub para resultado
end comportamento;