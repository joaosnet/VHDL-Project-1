library IEEE; -- Biblioteca padrão IEEE para VHDL
use ieee.std_logic_1164.all; -- Pacote que define o tipo de dados std_logic e operações relacionadas
use ieee.numeric_std.all; -- Pacote que define o tipo de dados unsigned e operações relacionadas

entity notb is -- Declaração da entidade notb
	generic(
		nbits : integer := 4 -- Parâmetro genérico que define o número de bits
	);
	port(
		op_b : in std_logic_vector(nbits-1 downto 0); -- Portas de entrada op_a e op_b do tipo std_logic_vector
		sel : in std_logic; -- Porta de entrada sel do tipo std_logic
		resultado : out std_logic_vector(nbits-1 downto 0) -- Porta de saída resultado do tipo std_logic_vector
	);
end notb;

architecture comportamento of notb is -- Declaração da arquitetura comportamento para a entidade notb
	signal notb : std_logic_vector(nbits-1 downto 0); -- Declaração dos sinais notb e sub do tipo std_logic_vector
begin
	notb <= std_logic_vector(not unsigned(op_b)); -- notb dos valores de op_a e op_b convertidos para unsigned e depois convertidos para std_logic_vector
	resultado <= notb when sel="0110"; -- Atribuição do valor de notb para resultado quando sel é '0110', caso contrário, atribui o valor de sub para resultado
end comportamento;