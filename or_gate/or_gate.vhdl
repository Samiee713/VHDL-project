-- OR Gate Implementation in VHDL
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR_Gate is
    Port (
        A : in STD_LOGIC;  -- Input A
        B : in STD_LOGIC;  -- Input B
        Y : out STD_LOGIC  -- Output Y
    );
end OR_Gate;

architecture Behavioral of OR_Gate is
begin
    Y <= A or B;  -- Logical OR operation
end Behavioral;
