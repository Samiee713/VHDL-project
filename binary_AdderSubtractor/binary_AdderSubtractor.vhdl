library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BINARY_ADDER_SUBTRACTOR is
    Port (
        A : in STD_LOGIC_VECTOR(3 downto 0);  -- 4-bit Input A
        B : in STD_LOGIC_VECTOR(3 downto 0);  -- 4-bit Input B
        Mode : in STD_LOGIC;                   -- Mode: 0 for Add, 1 for Subtract
        Sum : out STD_LOGIC_VECTOR(3 downto 0); -- 4-bit Sum Output
        Cout : out STD_LOGIC;                  -- Carry Output
        Borrow : out STD_LOGIC                 -- Borrow Output (for Subtraction)
    );
end BINARY_ADDER_SUBTRACTOR;

architecture Behavioral of BINARY_ADDER_SUBTRACTOR is
    signal B_complement : STD_LOGIC_VECTOR(3 downto 0); -- 2's complement of B for subtraction
    signal Cin : STD_LOGIC;  -- Carry-in for adder
    signal C : STD_LOGIC_VECTOR(4 downto 0); -- Carry signals
begin
    -- Generate 2's complement of B for subtraction
    B_complement <= (NOT B) when Mode = '1' else B;

    -- Carry-in for subtraction (1 for 2's complement)
    Cin <= '1' when Mode = '1' else '0';

    -- Full Adder logic for each bit
    gen: for i in 0 to 3 generate
        process (A(i), B_complement(i), Cin, Mode)
        begin
            Sum(i) <= A(i) XOR B_complement(i) XOR Cin; -- Sum calculation
            C(i+1) <= (A(i) AND B_complement(i)) OR (A(i) AND Cin) OR (B_complement(i) AND Cin); -- Carry calculation
        end process;
    end generate;

    -- Final carry-out or borrow detection
    Cout <= C(4);
    Borrow <= C(4) when Mode = '1' else '0';

end Behavioral;
