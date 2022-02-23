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
    
begin

    UUT : m_counter port map (clk => clk, reset => reset, m => m, q => q);
    
    clk_pulse: process
    begin
    
        if (clk = '0') then
            clk <= '1';
        else
            clk <= '0';
        end if;
        
        wait for 20 ns;
    
    end process;
    
    m <= "1010";


end Behavioral;
