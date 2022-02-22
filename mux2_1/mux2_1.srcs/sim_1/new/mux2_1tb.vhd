library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;

entity mux2x1tb is
--  Port ( );
end mux2x1tb;

architecture Behavioral of mux2x1tb is
component mux_2x1 is
    port (
    in1 : in STD_LOGIC; 
    in2 : in STD_LOGIC; 
    sel : in STD_LOGIC; 
    output : out STD_LOGIC
    );
end component;

-- Signal assignments-
signal in1 : std_logic;
signal in2 : std_logic;
signal sel : std_logic;
signal output : std_logic;

begin
UUT : entity work.mux_2x1
        port map (
        in1    => in1,
        in2    => in2,
        sel => sel,
        output => output);

    Process
    variable temp : std_logic_vector(2 downto 0);
    begin
    
        for i in 0 to 7 loop
            temp := std_logic_vector(to_unsigned(i, 3));
            in1 <= temp(2);
            in2 <= temp(1);
            sel <= temp(0);
            wait for 10 ns;
        end loop;
        
    wait;
    end process;


end Behavioral;
