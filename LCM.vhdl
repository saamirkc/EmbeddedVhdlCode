library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity LCM_FSM is
    Port (
        clk, rst, start : in std_logic;
        w : in natural range 1 to 10;  -- Maximum number of inputs
        input_data : in positive range 1 to 2**15 - 1;
        result : out positive range 1 to 2**15 - 1
    );
end entity LCM_FSM;

architecture behavioral of LCM_FSM is
    type state_type is (IDLE, PROCESSING, DONE);
    signal state : state_type := IDLE;
    signal current_num, current_lcm : positive := 1;
    
    function Euclidean_HCF(X, Y : positive) return positive is
        variable A, B : positive := X;
    begin
        while B /= 0 loop
            (A, B) := (B, A mod B);
        end loop;
        return A;
    end function Euclidean_HCF;

    function Calculate_LCM(X, Y : positive) return positive is
        variable HCF : positive := Euclidean_HCF(X, Y);
    begin
        return X * Y / HCF;
    end function Calculate_LCM;

begin
    process (clk, rst)
    begin
        if rst = '1' then
            state <= IDLE;
            current_num <= 1;
            current_lcm <= 1;
            result <= 1;
        elsif rising_edge(clk) then
            case state is
                when IDLE =>
                    if start = '1' then
                        state <= PROCESSING;
                    end if;
                when PROCESSING =>
                    current_lcm <= Calculate_LCM(current_lcm, input_data);
                    current_num <= current_num + 1;
                    if current_num = w then
                        state <= DONE;
                    end if;
                when DONE =>
                    state <= IDLE;
                    result <= current_lcm;
            end case;
        end if;
    end process;
end architecture behavioral;
