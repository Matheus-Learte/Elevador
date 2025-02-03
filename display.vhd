library ieee;
use ieee.std_logic_1164.all;

entity display is
	port (
		A : in  std_logic_vector (3 downto 0);
		O_0 : out std_logic_vector (6 downto 0);
		O_1 : out std_logic_vector (6 downto 0)
	);
end display;

architecture behavior of display is
begin
	process(A)
	begin
		case A is
			when "0000" => -- 0
				O_0 <= not "1111110"; -- 0
				O_1 <= not "1111110"; -- 0
			when "0001" => -- 1
				O_1 <= not "1111110"; -- 0
				O_0 <= not "0110000"; -- 1
			when "0010" => -- 2
				O_1 <= not "1111110"; -- 0
				O_0 <= not "1101101"; -- 2
			when "0011" => -- 3
				O_1 <= not "1111110"; -- 0
				O_0 <= not "1111001"; -- 3
			when "0100" => -- 4
				O_1 <= not "1111110"; -- 0
				O_0 <= not "0110011"; -- 4
			when "0101" => -- 5
				O_1 <= not "1111110"; -- 0
				O_0 <= not "1011011"; -- 5
			when "0110" => -- 6
				O_1 <= not "1111110"; -- 0
				O_0 <= not "1011111"; -- 6
			when "0111" => -- 7
				O_1 <= not "1111110"; -- 0
				O_0 <= not "1110000"; -- 7
			when "1000" => -- 8
				O_1 <= not "1111110"; -- 0
				O_0 <= not "1111111"; -- 8
			when "1001" => -- 9
				O_1 <= not "1111110"; -- 0
				O_0 <= not "1111011"; -- 9
			when "1010" => -- 10
				O_1 <= not "0110000"; -- 1
				O_0 <= not "1111110"; -- 0
			when "1011" => -- 11
				O_1 <= not "0110000"; -- 1
				O_0 <= not "0110000"; -- 1
			when "1100" => -- 12
				O_1 <= not "0110000"; -- 1
				O_0 <= not "1101101"; -- 2
			when "1101" => -- 13
				O_1 <= not "0110000"; -- 1
				O_0 <= not "1111001"; -- 3
			when "1110" => -- 14
				O_1 <= not "0110000"; -- 1
				O_0 <= not "0110011"; -- 4
			when "1111" => -- 15
				O_1 <= not "0110000"; -- 1
				O_0 <= not "1011011"; -- 4
			when others =>
				O_0 <= not "1111110"; -- 0
				O_1 <= not "1111110"; -- 0
		end case;
	end process;
end behavior;
	