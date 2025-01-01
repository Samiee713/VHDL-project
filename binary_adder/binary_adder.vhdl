library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BINARY_ADDER is
    Port (
        A : in STD_LOGIC_VECTOR(3 downto 0);  -- 4-bit Input A
        B : in STD_LOGIC_VECTOR(3 downto 0);  -- 4-bit Input B
        Cin : in STD_LOGIC;                  -- Carry Input
        Sum : out STD_LOGIC_VECTOR(3 downto 0); -- 4-bit Sum Output
        Cout : out STD_LOGIC                  -- Carry Output
    );
end BINARY_ADDER;

architecture Behavioral of BINARY_ADDER is
    signal C : STD_LOGIC_VECTOR(4 downto 0); -- Internal carry signals
begin
    -- Initialize carry input
    C(0) <= Cin;

    -- Full adder logic for each bit
    gen: for i in 0 to 3 generate
        process (A(i), B(i), C(i))
        begin
            Sum(i) <= A(i) XOR B(i) XOR C(i); -- Sum calculation
            C(i+1) <= (A(i) AND B(i)) OR (A(i) AND C(i)) OR (B(i) AND C(i)); -- Carry calculation
        end process;
    end generate;

    -- Final carry-out
    Cout <= C(4);

end Behavioral;
