library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity halfadder_tb is
--  Port ( );
end halfadder_tb;

architecture Behavioral of halfadder_tb is

    component halfadder is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           sum : out STD_LOGIC;
           Cout : out STD_LOGIC);
    end component;
    
    signal a, b, sum, Cout: std_logic;

begin

    UUT: halfadder port map (a => a, b => b, sum => sum, Cout => Cout);
    
    process
        variable temp : std_logic_vector(1 downto 0);
    begin
    
    for i in 0 to 3 loop
            temp := std_logic_vector(to_unsigned(i, 2));
            a <= temp(0);
            b <= temp(1);
            wait for 20 ns;
    end loop;
    end process;


end Behavioral;
