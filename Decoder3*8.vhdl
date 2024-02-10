library ieee;
use ieee.std_logic_1164.all;

entity decoder3x8 is
    Port (
        A : in std_logic_vector(2 downto 0);
        Q : out std_logic_vector (7 downto 0)
    );
end entity decoder3x8;

architecture decode of decoder3x8 is
begin
    process(A)
    begin
        case A is
            when "000" =>
                Q <= "00000001";
            when "001" => 
                Q <= "00000010";
            when "010" =>
                Q <= "00000100";
            when "011" =>
                Q <= "00001000";
            when "100" =>
                Q <= "00010000";
            when "101" =>
                Q <= "00100000";
            when "110" =>
                Q <= "01000000";
            when "111" =>
                Q <= "10000000";
            when others =>
                Q <= (others => '0');  -- Add default assignment for other input values
        end case;
    end process;
end architecture decode;
