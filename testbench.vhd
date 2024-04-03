library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;

entity testbench is
end testbench;

architecture test of testbench is
	component sd is
	port(
		in_a, in_b, in_c : in std_logic_vector(31 downto 0);
		sel_somasub, sel_mux : in std_logic;
		resultado : out std_logic_vector(31 downto 0)
	);
	end component;
	
	constant somasub_val : std_logic_vector(63 downto 0) := x"DEADBEEFBACABA01";
	constant mux_val     : std_logic_vector(63 downto 0) := x"01234ABCDE56789A";
	
	signal input_a, input_b, input_c, resultado : std_logic_vector(31 downto 0);
	signal sel_somasub, sel_mux : std_logic := '0';
	
	signal clock : std_logic := '0';
	
begin
	dut: sd
	port map(
		in_a => input_a,
		in_b => input_b, 
		in_c => input_c,
		sel_somasub => sel_somasub,
		sel_mux => sel_mux,
		resultado => resultado
	);
	
	process(clock)
		variable ptr_mux : integer := 0;
	begin
		if rising_edge(clock) then
			sel_somasub <= somasub_val(ptr_mux);
			sel_mux <= mux_val(ptr_mux);
			ptr_mux := ptr_mux + 1;
			if ptr_mux = 64 then
				ptr_mux	 := 0;
			end if;
		end if;
	end process;
	
	process(clock)
		file F: TEXT open READ_MODE is "C:\Users\ilanc\QuartusII\phi15\entradas.txt";
		variable L: LINE;
		variable entrada : integer;
	begin
		if rising_edge(clock) then
			if not endfile(F) then
				READLINE(F, L);
				READ(L, entrada);
				input_a <= std_logic_vector(to_unsigned(entrada, 32));
				
				READLINE(F, L);
				READ (L, entrada);
				input_b <= std_logic_vector(to_unsigned(entrada, 32));
				
				READLINE(F, L);
				READ (L, entrada);
				input_c <= std_logic_vector(to_unsigned(entrada, 32));
			end if;
		end if;
	end process;
	
	process(clock)
		file F: TEXT open WRITE_MODE is "C:\Users\ilanc\QuartusII\phi15\saida.txt";
		variable L: LINE;
	begin
		if rising_edge(clock) then
			WRITE (L, to_integer(unsigned(resultado)));
			WRITE (L, ' ');
			WRITE (L, to_bit(sel_somasub));
			WRITE (L, ' ');
			WRITE (L, to_bit(sel_mux));
			WRITELINE (F, L);
		end if;
	end process;
	
	clock <= not clock after 5 ns;
end test;