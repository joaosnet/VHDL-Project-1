library ieee; -- Biblioteca IEEE para utilizar pacotes padrão
use ieee.std_logic_1164.all; -- Pacote para utilizar tipos de dados lógicos
use ieee.numeric_std.all; -- Pacote para utilizar tipos de dados numéricos

use std.textio.all; -- Pacote para manipulação de arquivos de texto

entity testbench is -- Declaração da entidade testbench
end testbench;

architecture test of testbench is -- Declaração da arquitetura test para a entidade testbench
	component sd is -- Declaração do componente sd
	port(
		in_a, in_b, in_c : in std_logic_vector(31 downto 0); -- Portas de entrada in_a, in_b, in_c do tipo std_logic_vector de tamanho 32 bits
		sel_somasub, sel_mux : in std_logic; -- Portas de entrada sel_somasub e sel_mux do tipo std_logic
		resultado : out std_logic_vector(31 downto 0) -- Porta de saída resultado do tipo std_logic_vector de tamanho 32 bits
	);
	end component;
	
	constant somasub_val : std_logic_vector(63 downto 0) := x"DEADBEEFBACABA01"; -- Constante somasub_val do tipo std_logic_vector de tamanho 64 bits com valor hexadecimal
	constant mux_val     : std_logic_vector(63 downto 0) := x"01234ABCDE56789A"; -- Constante mux_val do tipo std_logic_vector de tamanho 64 bits com valor hexadecimal
	
	signal input_a, input_b, input_c, resultado : std_logic_vector(31 downto 0); -- Sinais input_a, input_b, input_c, resultado do tipo std_logic_vector de tamanho 32 bits
	signal sel_somasub, sel_mux : std_logic := '0'; -- Sinais sel_somasub, sel_mux do tipo std_logic com valor inicial '0'
	
	signal clock : std_logic := '0'; -- Sinal clock do tipo std_logic com valor inicial '0'
	
begin
	dut: sd -- Instanciação do componente sd com o nome dut
	port map(
		in_a => input_a,
		in_b => input_b, 
		in_c => input_c,
		sel_somasub => sel_somasub,
		sel_mux => sel_mux,
		resultado => resultado
	);
	
	process(clock) -- Processo sensível ao sinal clock
		variable ptr_mux : integer := 0; -- Variável local ptr_mux do tipo integer com valor inicial 0
	begin
		if rising_edge(clock) then -- Se ocorrer uma borda de subida do sinal clock
			sel_somasub <= somasub_val(ptr_mux); -- Atribui o valor correspondente da constante somasub_val ao sinal sel_somasub
			sel_mux <= mux_val(ptr_mux); -- Atribui o valor correspondente da constante mux_val ao sinal sel_mux
			ptr_mux := ptr_mux + 1; -- Incrementa o valor da variável ptr_mux
			if ptr_mux = 64 then -- Se o valor da variável ptr_mux for igual a 64
				ptr_mux	 := 0; -- Atribui o valor 0 à variável ptr_mux
			end if;
		end if;
	end process;
	
	process(clock) -- Processo sensível ao sinal clock
		file F: TEXT open READ_MODE is "C:\Users\joaod\Documents\GitHub\VHDL-Project-1\entradas.txt"; -- Abre o arquivo de texto "entradas.txt" para leitura
		variable L: LINE; -- Variável local L do tipo LINE
		variable entrada : integer; -- Variável local entrada do tipo integer
	begin
		if rising_edge(clock) then -- Se ocorrer uma borda de subida do sinal clock
			if not endfile(F) then -- Se não for o final do arquivo F
				READLINE(F, L); -- Lê uma linha do arquivo F e armazena em L
				READ(L, entrada); -- Lê um valor inteiro da linha L e armazena em entrada
				input_a <= std_logic_vector(to_unsigned(entrada, 32)); -- Converte o valor de entrada para std_logic_vector de tamanho 32 bits e atribui ao sinal input_a
				
				READLINE(F, L); -- Lê uma linha do arquivo F e armazena em L
				READ (L, entrada); -- Lê um valor inteiro da linha L e armazena em entrada
				input_b <= std_logic_vector(to_unsigned(entrada, 32)); -- Converte o valor de entrada para std_logic_vector de tamanho 32 bits e atribui ao sinal input_b
				
				READLINE(F, L); -- Lê uma linha do arquivo F e armazena em L
				READ (L, entrada); -- Lê um valor inteiro da linha L e armazena em entrada
				input_c <= std_logic_vector(to_unsigned(entrada, 32)); -- Converte o valor de entrada para std_logic_vector de tamanho 32 bits e atribui ao sinal input_c
			end if;
		end if;
	end process;
	
	process(clock) -- Processo sensível ao sinal clock
		file F: TEXT open WRITE_MODE is "C:\Users\joaod\Documents\GitHub\VHDL-Project-1\saida.txt"; -- Abre o arquivo de texto "saida.txt" para escrita
		variable L: LINE; -- Variável local L do tipo LINE
	begin
		if rising_edge(clock) then -- Se ocorrer uma borda de subida do sinal clock
			WRITE (L, to_integer(unsigned(resultado))); -- Escreve o valor inteiro convertido do sinal resultado em L
			WRITE (L, ' '); -- Escreve um espaço em L
			WRITE (L, to_bit(sel_somasub)); -- Escreve o valor do sinal sel_somasub em L
			WRITE (L, ' '); -- Escreve um espaço em L
			WRITE (L, to_bit(sel_mux)); -- Escreve o valor do sinal sel_mux em L
			WRITELINE (F, L); -- Escreve a linha L no arquivo F
		end if;
	end process;
	
	clock <= not clock after 5 ns; -- Atribui o valor complementar do sinal clock após 5 ns ao próprio sinal clock
end test;