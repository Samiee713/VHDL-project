library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_tb is
end full_adder_tb;

architecture Behavioral of full_adder_tb is
    signal A   : STD_LOGIC := '0';
    signal B   : STD_LOGIC := '0';
    signal Cin : STD_LOGIC := '0';
    signal Sum : STD_LOGIC;
    signal Cout : STD_LOGIC;
begin
    uut: entity work.full_adder
        port map (
            A   => A,
            B   => B,
            Cin => Cin,
            Sum => Sum,
            Cout => Cout
        );

    process
    begin
        A <= '0'; B <= '0'; Cin <= '0';
        wait for 10 ns;
        A <= '0'; B <= '0'; Cin <= '1';
        wait for 10 ns;
        A <= '0'; B <= '1'; Cin <= '0';
        wait for 10 ns;
        A <= '0'; B <= '1'; Cin <= '1';
        wait for 10 ns;
        A <= '1'; B <= '0'; Cin <= '0';
        wait for 10 ns;
        A <= '1'; B <= '0'; Cin <= '1';
        wait for 10 ns;
        A <= '1'; B <= '1'; Cin <= '0'; 
        wait for 10 ns;
        A <= '1'; B <= '1'; Cin <= '1'; 
        wait for 10 ns;
        wait;
    end process;
end Behavioral;