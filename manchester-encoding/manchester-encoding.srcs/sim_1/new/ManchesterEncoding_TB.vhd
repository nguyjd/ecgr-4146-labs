library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ManchesterEncoding_TB is
generic(WIDTH: integer := 8);
end ManchesterEncoding_TB;

architecture Behavioral of ManchesterEncoding_TB is

    component ManchesterEncoding is 
        port(str_input: in std_logic_vector (WIDTH - 1 downto 0);  
         clk: in std_logic;  
         reset: in std_logic;
         enable: in std_logic; 
         str_output: out std_logic  
        );
    end component;
    
    signal clk, reset, enable, str_output: std_logic := '0';
    signal str_input: std_logic_vector(WIDTH - 1 downto 0) := (others => '0');
    
    -- Clock Period 
    constant Tclk: time := 20 ns;

begin

    UUT : ManchesterEncoding port map 
                            (str_input => str_input, clk => clk, reset => reset,  
                             enable => enable, str_output => str_output);

    clk_pulse: process
    begin
    
        clk <= '1';
        wait for Tclk/2;
        
        clk <= '0';
        wait for Tclk/2;
    
    end process;
    
    test: process
    begin
        
        reset <= '1';
        wait for 100 ns;
        
        str_input <= "11000110";
        reset <= '0';
        enable <= '1';
        wait for 200 ns;
        
        reset <= '1';
        wait for 100 ns;
        
        str_input <= "00100100";
        reset <= '0';
        enable <= '1';
        wait for 200 ns;
        
        reset <= '1';
        wait for 100 ns;
        
        str_input <= "10110100";
        reset <= '0';
        enable <= '1';
        wait for 200 ns;
    
    end process;
    
    


end Behavioral;
