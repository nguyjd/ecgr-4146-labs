library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity fulladder_tb is
--  Port ( );
end fulladder_tb;

architecture Behavioral of fulladder_tb is
    
    component fulladder is
        Port ( a : in STD_LOGIC;
               b : in STD_LOGIC;
               Cin : in STD_LOGIC;
               sum : out STD_LOGIC;
               Cout : out STD_LOGIC);
    end component;
    
    signal a, b, Cin, sum, cout : STD_Logic;
    
begin

    UUT: fulladder port map (a => a, b => b, Cin => Cin, sum => sum, Cout => cout);
    
    process
        variable temp : std_logic_vector(2 downto 0);
    begin
    
    for i in 0 to 7 loop
            temp := std_logic_vector(to_unsigned(i, 3));
            a <= temp(0);
            b <= temp(1);
            Cin <= temp(2);
            wait for 100 ns;
    end loop;
    end process;

end Behavioral;
