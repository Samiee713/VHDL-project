library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BINARY_ADDER_SUBTRACTOR_TB is
end BINARY_ADDER_SUBTRACTOR_TB;

architecture Behavioral of BINARY_ADDER_SUBTRACTOR_TB is
    signal A, B : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal Mode : STD_LOGIC := '0';
    signal Sum : STD_LOGIC_VECTOR(3 downto 0);
    signal Cout, Borrow : STD_LOGIC;
begin
    -- Instantiate the Binary Adder-Subtractor
    uut: entity work.BINARY_ADDER_SUBTRACTOR
        Port map (
            A => A,
            B => B,
            Mode => Mode,
            Sum => Sum,
            Cout => Cout,
            Borrow => Borrow
        );

    -- Test process
    process
    begin
        -- Test case 1: A = 0000, B = 0000, Mode = 0 (Addition)
        A <= "0000"; B <= "0000"; Mode <= '0';
        wait for 10 ns;

        -- Test case 2: A = 0101, B = 0011, Mode = 0 (Addition)
        A <= "0101"; B <= "0011"; Mode <= '0';
        wait for 10 ns;

        -- Test case 3: A = 1111, B = 0001, Mode = 1 (Subtraction)
        A <= "1111"; B <= "0001"; Mode <= '1';
        wait for 10 ns;

        -- Test case 4: A = 1001, B = 0110, Mode = 1 (Subtraction)
        A <= "1001"; B <= "0110"; Mode <= '1';
        wait for 10 ns;

        wait; -- Wait indefinitely
    end process;
end Behavioral;
