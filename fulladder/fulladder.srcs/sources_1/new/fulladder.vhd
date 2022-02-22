library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity FullAdder is
    Port (
        A: in std_logic_vector(3 downto 0);
        B: in std_logic_vector(3 downto 0);
        sum: out std_logic_vector(3 downto 0);
        carry: out std_logic
    );
end FullAdder;

architecture Behavioral of FullAdder is
signal temp : std_logic_vector(4 downto 0);
begin

    sum <= std_logic_vector( unsigned(A) + unsigned(B));
    temp <= std_logic_vector("0"&unsigned(A)+ unsigned(B));
    carry <= temp(4);
    
end Behavioral;
