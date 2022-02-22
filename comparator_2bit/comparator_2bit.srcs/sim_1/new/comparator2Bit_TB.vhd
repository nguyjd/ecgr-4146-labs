library IEEE;
library work;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity comparator2Bit_TB is
--  Port ( );
end comparator2Bit_TB;

architecture Behavioral of comparator2Bit_TB is

    component comparator2Bit is
        port( a, b : in std_logic_vector(1 downto 0);
            eq : out std_logic
        );
    end component;

    signal a_dataflow, b_dataflow: std_logic_vector(1 downto 0);
    signal eq_dataflow: std_logic;
    
    signal a_behavioral, b_behavioral: std_logic_vector(1 downto 0);
    signal eq_behavioral: std_logic;
    
    signal a_structural, b_structural: std_logic_vector(1 downto 0);
    signal eq_structural: std_logic;
    
begin
    
    dataflow_comparator2Bit: entity work.comparator2Bit(Dataflow)
    port map(a => a_dataflow, b => b_dataflow, eq => eq_dataflow);
    
    behavioral_comparator2Bit: entity work.comparator2Bit(Behavioral)
    port map(a => a_behavioral, b => b_behavioral, eq => eq_behavioral);
    
    structural_comparator2Bit: entity work.comparator2Bit(Structural)
    port map(a => a_structural, b => b_structural, eq => eq_structural);
    
    process
        variable temp : std_logic_vector(3 downto 0);
    begin
    for i in 0 to 15 loop
            temp := std_logic_vector(to_unsigned(i, 4));
            a_dataflow(0) <= temp(0);
            a_dataflow(1) <= temp(1);
            b_dataflow(0) <= temp(2);
            b_dataflow(1) <= temp(3);
            
            a_behavioral(0) <= temp(0);
            a_behavioral(1) <= temp(1);
            b_behavioral(0) <= temp(2);
            b_behavioral(1) <= temp(3);
            
            a_structural(0) <= temp(0);
            a_structural(1) <= temp(1);
            b_structural(0) <= temp(2);
            b_structural(1) <= temp(3);
            wait for 10 ns;
    end loop;
    
    wait;
    end process;

end Behavioral;
