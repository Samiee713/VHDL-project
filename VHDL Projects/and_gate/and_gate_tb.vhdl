-- Testbench for AND Gate
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND_Gate_tb is
end AND_Gate_tb;

architecture Behavioral of AND_Gate_tb is
    -- Component Declaration
    component AND_Gate
        Port (
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    -- Signals to connect to the gate
    signal A : STD_LOGIC := '0';
    signal B : STD_LOGIC := '0';
    signal Y : STD_LOGIC;

begin
    -- Instantiate the AND Gate
    UUT: AND_Gate
        Port map (
            A => A,
            B => B,
            Y => Y
        );

    -- Stimulus Process
    stim_proc: process
    begin
        -- Test Case 1: A = 0, B = 0
        A <= '0'; B <= '0';
        wait for 10 ns;

        -- Test Case 2: A = 0, B = 1
        A <= '0'; B <= '1';
        wait for 10 ns;

        -- Test Case 3: A = 1, B = 0
        A <= '1'; B <= '0';
        wait for 10 ns;

        -- Test Case 4: A = 1, B = 1
        A <= '1'; B <= '1';
        wait for 10 ns;

        wait;
    end process;
end Behavioral;
