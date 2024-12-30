library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity not_gate_tb is
end not_gate_tb;

architecture Behavioral of not_gate_tb is
    signal input_signal : STD_LOGIC := '0';
    signal output_signal : STD_LOGIC;
begin
    uut: entity work.not_gate
        port map (
            input_signal => input_signal,
            output_signal => output_signal
        );

    process
    begin
        input_signal <= '0';
        wait for 10 ns;
        input_signal <= '1';
        wait for 10 ns;
        wait;
    end process;
end Behavioral;
