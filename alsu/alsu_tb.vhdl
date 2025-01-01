library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALSU_TB is
-- Testbench does not have ports
end ALSU_TB;

architecture Behavioral of ALSU_TB is
    -- Component Declaration for ALSU
    component ALSU
        Port (
            A : in STD_LOGIC_VECTOR(3 downto 0);
            B : in STD_LOGIC_VECTOR(3 downto 0);
            Op : in STD_LOGIC_VECTOR(2 downto 0);
            Shift : in STD_LOGIC_VECTOR(1 downto 0);
            Result : out STD_LOGIC_VECTOR(3 downto 0);
            Cout : out STD_LOGIC;
            Borrow : out STD_LOGIC
        );
    end component;

    -- Testbench signals
    signal A, B, Result : STD_LOGIC_VECTOR(3 downto 0);
    signal Op : STD_LOGIC_VECTOR(2 downto 0);
    signal Shift : STD_LOGIC_VECTOR(1 downto 0);
    signal Cout, Borrow : STD_LOGIC;

begin
    -- Instantiate the ALSU
    uut: ALSU
        Port map (
            A => A,
            B => B,
            Op => Op,
            Shift => Shift,
            Result => Result,
            Cout => Cout,
            Borrow => Borrow
        );

    -- Test process
    stimulus: process
    begin
        -- Test Case 1: Addition (Op = "000")
        A <= "0011";  -- 3
        B <= "0101";  -- 5
        Op <= "000";  -- Add
        Shift <= "00";  -- No shift
        wait for 10 ns;

        -- Test Case 2: Subtraction (Op = "001")
        A <= "0101";  -- 5
        B <= "0011";  -- 3
        Op <= "001";  -- Subtract
        wait for 10 ns;

        -- Test Case 3: AND Operation (Op = "010")
        A <= "1100";
        B <= "1010";
        Op <= "010";  -- AND
        wait for 10 ns;

        -- Test Case 4: OR Operation (Op = "011")
        A <= "1100";
        B <= "1010";
        Op <= "011";  -- OR
        wait for 10 ns;

        -- Test Case 5: XOR Operation (Op = "100")
        A <= "1100";
        B <= "1010";
        Op <= "100";  -- XOR
        wait for 10 ns;

        -- Test Case 6: Logical Left Shift (Op = "101", Shift = "01")
        A <= "1101";  -- 13
        Op <= "101";  -- Shift operation
        Shift <= "01";  -- Logical left shift
        wait for 10 ns;

        -- Test Case 7: Logical Right Shift (Op = "101", Shift = "10")
        A <= "1101";  -- 13
        Op <= "101";  -- Shift operation
        Shift <= "10";  -- Logical right shift
        wait for 10 ns;

        -- Test Case 8: No Shift (Op = "101", Shift = "00")
        A <= "1101";
        Op <= "101";  -- Shift operation
        Shift <= "00";  -- No shift
        wait for 10 ns;

        -- Stop the simulation
        wait;
    end process;
end Behavioral;
