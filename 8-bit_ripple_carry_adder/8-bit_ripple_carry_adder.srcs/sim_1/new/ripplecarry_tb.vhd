library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ripplecarry_tb is
-- Port ( );
end ripplecarry_tb;

architecture Behavioral of ripplecarry_tb is

    component ripplecarryadder is
    generic ( WIDTH : positive := 7);
    Port (  a : in STD_LOGIC_VECTOR (WIDTH downto 0);
            b : in STD_LOGIC_VECTOR (WIDTH downto 0);
            sum : out STD_LOGIC_VECTOR (WIDTH downto 0);
            Cout : out STD_LOGIC);
    end component;
    
signal A, B, sum : STD_Logic_vector(7 downto 0);
signal cout : STD_Logic
;

begin

    UUT : ripplecarryadder port map (a => A, b => B, sum => sum, Cout => cout);
    
    process
    begin
    
    A <= "00000000";
    B <= "00000000";
    wait for 100 ns;
    
    A <= "00000000";
    B <= "00000001";
    wait for 100 ns;
    
    A <= "11100000";
    B <= "11111111";
    wait for 100 ns;
    
    A <= "00010101";
    B <= "00100101";
    wait for 100 ns;
    
    A <= "10100111";
    B <= "00000011";
    wait for 100 ns;
    
    A <= "01101111";
    B <= "11100101";
    wait for 100 ns;
    
    A <= "00000100";
    B <= "00000010";
    wait for 100 ns;
    
    A <= "11100111";
    B <= "01110111";
    wait for 100 ns;
    
    end process;
end Behavioral;
