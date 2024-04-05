library IEEE; -- Biblioteca padrão IEEE para VHDL
use ieee.std_logic_1164.all; -- Pacote que define o tipo de dados std_logic e operações relacionadas
use ieee.numeric_std.all; -- Pacote que define o tipo de dados unsigned e operações relacionadas

entity shift is -- Declaração da entidade shift
	generic(
		nbits : integer := 4; -- Parâmetro genérico para o número de bits
		shift : integer := 4; -- Parâmetro genérico para o valor de deslocamento
		shift_config : string := "esquerda" -- Parâmetro genérico para a configuração do deslocamento (esquerda ou direita)
	);
	port(
		op_a : in std_logic_vector(nbits-1 downto 0); -- Porta de entrada para o operando A
		resultado : out std_logic_vector(nbits-1 downto 0) -- Porta de saída para o resultado
	);
end shift;

architecture comportamento of shift is -- Declaração da arquitetura comportamento para a entidade shift
begin

IMPLEMENTACAO_SHIFT_LEFT: if shift_config = "esquerda" generate -- Geração de código para a implementação do deslocamento para a esquerda
	resultado <= std_logic_vector(shift_left(unsigned(op_a), shift)); -- Realiza o deslocamento para a esquerda do operando A e atribui o resultado à porta de saída
end generate IMPLEMENTACAO_SHIFT_LEFT;

IMPLEMENTACAO_SHIFT_RIGHT: if shift_config = "direita" generate -- Geração de código para a implementação do deslocamento para a direita
	resultado <= std_logic_vector(shift_right(unsigned(op_a), shift)); -- Realiza o deslocamento para a direita do operando A e atribui o resultado à porta de saída
end generate IMPLEMENTACAO_SHIFT_RIGHT;

end comportamento;