library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BINARY_ADDER_TB is
end BINARY_ADDER_TB;

architecture Behavioral of BINARY_ADDER_TB is
    signal A, B : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal Cin : STD_LOGIC := '0';
    signal Sum : STD_LOGIC_VECTOR(3 downto 0);
    signal Cout : STD_LOGIC;
begin
    -- Instantiate the Binary Adder
    uut: entity work.BINARY_ADDER
        Port map (
            A => A,
            B => B,
            Cin => Cin,
            Sum => Sum,
            Cout => Cout
        );

    -- Test process
    process
    begin
        -- Test case 1: A = 0000, B = 0000, Cin = 0
        A <= "0000"; B <= "0000"; Cin <= '0';
        wait for 10 ns;

        -- Test case 2: A = 0101, B = 0011, Cin = 0
        A <= "0101"; B <= "0011"; Cin <= '0';
        wait for 10 ns;

        -- Test case 3: A = 1111, B = 0001, Cin = 0
        A <= "1111"; B <= "0001"; Cin <= '0';
        wait for 10 ns;

        -- Test case 4: A = 1111, B = 1111, Cin = 1
        A <= "1111"; B <= "1111"; Cin <= '1';
        wait for 10 ns;

        wait; -- Wait indefinitely
    end process;
end Behavioral;
