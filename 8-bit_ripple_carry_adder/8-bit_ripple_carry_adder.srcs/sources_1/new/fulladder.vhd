library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity fulladder is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           Cin : in STD_LOGIC;
           sum : out STD_LOGIC;
           Cout : out STD_LOGIC);
end fulladder;

architecture Behavioral of fulladder is
    component halfadder is
        Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           sum : out STD_LOGIC;
           Cout : out STD_LOGIC);
    end component;
    
    signal s1, c1, c2: std_logic;
begin

   halfadd1: halfadder
   port map (a => a, b => b, sum => s1, Cout => c1);
    
   halfadd2: halfadder
   port map (a => s1, b => Cin, sum => sum, Cout => c2);
    
   Cout <= c1 or c2;

end Behavioral;
