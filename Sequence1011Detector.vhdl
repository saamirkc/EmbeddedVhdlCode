library ieee;
use ieee.std_logic_1164.ALL;

entity seq1011 is
    Port (
        x   : in  std_logic;  -- input bitstream
        y   : out std_logic;  -- output port
        clk : in  std_logic;  -- clock input
        rst : in  std_logic   -- reset all states
    );
end seq1011;

architecture seq of seq1011 is
    type t_state is (S0, S1, S2, S3, S4);  -- S0:0, S1:1, S2:10, S3:101, S4:1011
    signal state : t_state;

begin
    process (clk) is
    begin
        if rising_edge(clk) then
            if rst = '1' then  -- Corrected typo in 'rst' condition
                state <= S0;
                y <= '0';
            else
                case state is
                    when S0 =>
                        y <= '0';
                        if x = '1' then
                            state <= S1;
                        end if;
                    when S1 =>
                        y <= '0';
                        if x = '0' then
                            state <= S2;
                        end if;
                    when S2 =>
                        y <= '0';
                        if x = '0' then
                            state <= S0;
                        else
                            state <= S3;
                        end if;
                    when S3 =>
                        if x = '1' then
                            state <= S4;
                            y <= '1';
                        else
                            state <= S2;
                            y <= '0';
                        end if;
                    when S4 =>
                        y <= '0';
                        if x = '1' then
                            state <= S1;
                        else
                            state <= S2;
                        end if;
                end case;
            end if;
        end if;
    end process;
end seq;
