library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ripplecarryadder is

    generic (WIDTH: positive := 7);
    Port ( a : in STD_LOGIC_VECTOR (WIDTH downto 0);
           b : in STD_LOGIC_VECTOR (WIDTH downto 0);
           sum : out STD_LOGIC_VECTOR (WIDTH downto 0);
           Cout : out STD_LOGIC);

end ripplecarryadder;

architecture Behavioral of ripplecarryadder is

    component halfadder is
        Port ( a : in STD_LOGIC;
               b : in STD_LOGIC;
               sum : out STD_LOGIC;
               Cout : out STD_LOGIC);
    end component;
    
    component fulladder is
        Port ( a : in STD_LOGIC;
               b : in STD_LOGIC;
               Cin : in STD_LOGIC;
               sum : out STD_LOGIC;
               Cout : out STD_LOGIC);
    end component;

    signal c: std_logic_vector(WIDTH+1 downto 1) := (others => '0'); 

begin

    halfadd1: halfadder
    port map (a => a(0), b => b(0), sum => sum(0), Cout => c(1));

    fulladders: for i in 1 to WIDTH generate
        uut: FullAdder 
        port map (a => a(i), b => b(i), cin => c(i), sum => sum(i), cout => c(i+1));
    end generate;
    
    cout <= c(7);

end Behavioral;
