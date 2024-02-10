library ieee;
use ieee.std_logic_1164.all;

entity decoder3x8_tb is
end entity decoder3x8_tb;

architecture testbench of decoder3x8_tb is
    signal A : std_logic_vector(2 downto 0);
    signal Q : std_logic_vector(7 downto 0);
begin
    -- Instantiate the decoder
    UUT: entity work.decoder3x8
        port map (
            A => A,
            Q => Q
        );

    -- Stimulus process
    process
    begin
        A <= "000"; wait for 10 ns;
        A <= "001"; wait for 10 ns;
        A <= "010"; wait for 10 ns;
        A <= "011"; wait for 10 ns;
        A <= "100"; wait for 10 ns;
        A <= "101"; wait for 10 ns;
        A <= "110"; wait for 10 ns;
        A <= "111"; wait for 10 ns;
        -- Add more test cases if needed

        wait;
    end process;
end architecture testbench;
