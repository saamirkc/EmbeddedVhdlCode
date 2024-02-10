library ieee;
use ieee.std_logic_1164.all;

entity mux is
    Port (
        a0, a1, s, en : in std_logic;
        q : out std_logic
    );
end mux;

architecture behaviour of mux is
begin
    process(a0, a1, s, en)  -- Added a sensitivity list for combinational process
    begin
        if en = '1' then
            if s = '0' then
                q <= a0;
            else
                q <= a1;
            end if;
        else
            q <= '0';
        end if;
    end process;
end behaviour;
