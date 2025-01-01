library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALSU is
    Port (
        A : in STD_LOGIC_VECTOR(3 downto 0);    -- 4-bit Input A
        B : in STD_LOGIC_VECTOR(3 downto 0);    -- 4-bit Input B
        Op : in STD_LOGIC_VECTOR(2 downto 0);   -- 3-bit Operation Control
        Shift : in STD_LOGIC_VECTOR(1 downto 0); -- Shift control: 00=None, 01=Left, 10=Right
        Result : out STD_LOGIC_VECTOR(3 downto 0); -- 4-bit Result
        Cout : out STD_LOGIC;   -- Carry-out (for addition)
        Borrow : out STD_LOGIC  -- Borrow (for subtraction)
    );
end ALSU;

architecture Behavioral of ALSU is
    signal Sum, Sub_Result, And_Result, Or_Result, Xor_Result : STD_LOGIC_VECTOR(3 downto 0);
    signal Shift_Left, Shift_Right : STD_LOGIC_VECTOR(3 downto 0);
    signal A_signed, B_signed : SIGNED(3 downto 0);
begin
    -- Convert STD_LOGIC_VECTOR to SIGNED for arithmetic operations
    A_signed <= SIGNED(A);
    B_signed <= SIGNED(B);

    -- Arithmetic operations
    Sum <= STD_LOGIC_VECTOR(A_signed + B_signed); -- Addition
    Sub_Result <= STD_LOGIC_VECTOR(A_signed - B_signed); -- Subtraction

    -- Logical operations
    And_Result <= A AND B;
    Or_Result <= A OR B;
    Xor_Result <= A XOR B;

    -- Shift operations
    Shift_Left <= A(2 downto 0) & '0'; -- Logical left shift
    Shift_Right <= '0' & A(3 downto 1); -- Logical right shift

    -- Multiplexer for operation selection
    process (Op, Shift, Sum, Sub_Result, And_Result, Or_Result, Xor_Result, Shift_Left, Shift_Right)
    begin
        case Op is
            when "000" => Result <= Sum; -- Addition
            when "001" => Result <= Sub_Result; -- Subtraction
            when "010" => Result <= And_Result; -- AND
            when "011" => Result <= Or_Result; -- OR
            when "100" => Result <= Xor_Result; -- XOR
            when "101" => -- Shift operation based on Shift input
                case Shift is
                    when "01" => Result <= Shift_Left; -- Logical left shift
                    when "10" => Result <= Shift_Right; -- Logical right shift
                    when others => Result <= A; -- No shift
                end case;
            when others => Result <= "0000"; -- Default case
        end case;
    end process;

    -- Carry-out and Borrow detection
    Cout <= '1' when (A_signed + B_signed) > "1111" else '0';  -- Carry-out for addition
    Borrow <= '1' when Op = "001" and (A_signed < B_signed) else '0'; -- Borrow for subtraction

end Behavioral;
