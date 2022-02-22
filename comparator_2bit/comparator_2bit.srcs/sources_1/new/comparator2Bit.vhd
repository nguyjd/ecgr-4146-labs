library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparator2Bit is
    port( a, b : in std_logic_vector(1 downto 0);
        eq : out std_logic
    );
end comparator2Bit;

architecture Dataflow of comparator2Bit is
    signal s0, s1, s2, s3: std_logic;
begin

    s0 <= (not a(0)) and (not a(1)) and (not b(0)) and (not b(1));
    s1 <= a(0) and (not a(1)) and b(0) and (not b(1));
    s2 <= (not a(0)) and a(1) and (not b(0)) and b(1);
    s3 <= a(0) and a(1) and b(0) and b(1);
    
    eq <= s0 or s1 or s2 or s3;
    
end dataflow;

architecture Behavioral of comparator2Bit is
begin

    process(a, b)
    begin
    
        if (a = b) then
            eq <= '1';
        else
            eq <= '0';
        end if;    
    
    end process;
    
end Behavioral;

architecture Structural of comparator2Bit is
    
    component comparator1Bit
        port( x, y : in std_logic;
        eq : out std_logic );
    end component;
    
    signal eq0, eq1: std_logic;
    
begin

    comparatorbit0: comparator1Bit 
        port map (x => a(0), y => b(0), eq => eq0);
        
    comparatorbit1: comparator1Bit 
        port map (x => a(1), y => b(1), eq => eq1);
        
    eq <= eq0 and eq1;
    
end Structural;