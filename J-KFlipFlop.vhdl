library ieee;
use ieee.std_logic_1164.all;

entity jkflipflop is
    Port (
        clk, clr, j, k : in std_logic;
        q, nq : out std_logic
    );
end jkflipflop;

architecture behaviour of jkflipflop is
    signal qt : std_logic;
begin
    process(clk, clr)
    begin
        if clr = '0' then  -- Assuming active-low asynchronous clear
            qt <= '0';
        elsif rising_edge(clk) then
            if j = '0' and k = '0' then
                qt <= '0';
            elsif j = '0' and k = '1' then
                qt <= '0';
            elsif j = '1' and k = '0' then
                qt <= '1';
            elsif j = '1' and k = '1' then
                qt <= not qt;
            end if;
        end if;
    end process;

    q <= qt;
    nq <= not qt;
end behaviour;
