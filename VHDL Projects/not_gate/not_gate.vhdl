library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NOT_Gate is
    Port (
        Input_Signal : in STD_LOGIC;
        Output_Signal : out STD_LOGIC
    );
end NOT_Gate;

architecture Behavioral of NOT_Gate is
begin
    Output_Signal <= not Input_Signal;
end Behavioral;