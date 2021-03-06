library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity halfadder is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           sum : out STD_LOGIC;
           Cout : out STD_LOGIC);
end halfadder;

architecture Behavioral of halfadder is
begin

    sum <= a xor b;
    Cout <= a and b;

end Behavioral;
