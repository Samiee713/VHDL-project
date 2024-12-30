library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity exor_gate is
    Port (
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        Y : out STD_LOGIC
    );
end exor_gate;

architecture Behavioral of exor_gate is
begin
    Y <= A xor B;  
end Behavioral;
