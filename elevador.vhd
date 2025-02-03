library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity elevador is
    port (
        clk : in std_logic;
        rst : in std_logic;
        destino : in unsigned(3 downto 0):= (others => '0');
        andar   : out unsigned(3 downto 0):= (others => '0');
        dir : out std_logic_vector(1 downto 0):= (others => '0')
    );
end elevador;

architecture main of elevador is
    type estados is (parado, subindo, descendo);
    signal estado: estados;
    signal andar_atual: unsigned(3 downto 0) := (others => '0');
    signal andar_dest: unsigned(3 downto 0) := (others => '0');

begin 
    process(clk)
    begin
        if(rst='1') then
            estado<= parado;
            andar_atual<= "0000";
            andar<="0000";
            andar_dest<="0000";
            dir<="00";
        elsif rising_edge(clk) then
            case estado is
                when parado=>
                    if(destino/=andar_dest) then
                        andar_dest<= destino;
                        if(destino>andar_dest) then
                            estado<=subindo;
                            dir<="01";
                        else
                            estado<=descendo;
                            dir<="10";
                        end if;
                    end if;
                when subindo=>
                        andar_atual<=andar_atual+1;
                        andar<=andar_atual+1;

                        if(andar_dest=andar_atual+1) then
                            estado<= parado;
                            dir<="00";
                        end if;

                when descendo=>
                        andar_atual<= andar_atual-1;
                        andar<= andar_atual-1;

                        if(andar_dest=andar_atual-1) then
                            estado<= parado;
                            dir<="00";
                        end if;
            end case;
        end if;
    end process;
end main;
