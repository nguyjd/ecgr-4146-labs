library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity m_counter_TB is
generic (mod_m: positive := 3 );
end m_counter_TB;

architecture Behavioral of m_counter_TB is
    
    component m_counter is 
        port (  clk, reset: in std_logic;
                m: in std_logic_vector(mod_m downto 0);
                q: out std_logic_vector(mod_m downto 0));
    end component;
    
    signal clk, reset: std_logic := '0';
    signal m, q: std_logic_vector(mod_m downto 0) := (others => '0');
    
    -- Clock Period 
    constant Tclk: time := 20 ns;
    
begin
    
    UUT : m_counter port map (clk => clk, reset => reset, m => m, q => q);
    
    clk_pulse: process
    begin
    
        clk <= '1';
        wait for Tclk/2;
        
        clk <= '0';
        wait for Tclk/2;
    
    end process;
    
    test_vec: process
    begin
    
        m <= "0010";
        wait for 200 ns;
        
        m <= "0101";
        wait for 200 ns;
        
        m <= "1100";
        wait;
    
    end process;
    
    reset_count: process
    begin
    
        wait for 500 ns;
        reset <= '1';
        
        wait for 100 ns;
        reset <= '0';
        
    end process;
    

end Behavioral;
