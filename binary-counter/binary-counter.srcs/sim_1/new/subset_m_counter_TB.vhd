library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity subset_m_counter_TB is
generic (mod_m: positive := 3 );
end subset_m_counter_TB;

architecture Behavioral of subset_m_counter_TB is
    
    component subset_m_counter is 
        port (  clk, reset: in std_logic;
                m: in std_logic_vector(mod_m downto 0);
                n: in std_logic_vector(mod_m downto 0);
                q: out std_logic_vector(mod_m downto 0));
    end component;
    
    signal clk, reset: std_logic := '0';
    signal n: std_logic_vector(mod_m downto 0) := "0010";
    signal m, q: std_logic_vector(mod_m downto 0) := (others => '0');
    
    -- Clock Period 
    constant Tclk: time := 20 ns;
    
begin
    
    UUT : subset_m_counter port map (clk => clk, reset => reset, m => m, n => n, q => q);
    
    m <= "1010";
    
    clk_pulse: process
    begin
    
        clk <= '1';
        wait for Tclk/2;
        
        clk <= '0';
        wait for Tclk/2;
    
    end process;
    
    process
    begin
    
        if (q = "1000") then
            
            reset <= '1';
            wait for 20 ns;
            reset <= '0';
        
        end if;
        
        wait for 20 ns;
    
    end process;


end Behavioral;
