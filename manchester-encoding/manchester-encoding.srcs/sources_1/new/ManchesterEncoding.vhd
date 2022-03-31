library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ManchesterEncoding is
    generic(WIDTH: integer := 8);
    port(str_input: in std_logic_vector (WIDTH - 1 downto 0);  
         clk: in std_logic;  
         reset: in std_logic;
         enable: in std_logic; 
         str_output: out std_logic  
    ); 
end ManchesterEncoding;

architecture Behavioral of ManchesterEncoding is

type states is (idle, stop, s0, s1, s2, s3,
                s4, s5 ,s6, s7);
signal statereg, statenext: states;
signal data_bit, str_output_next: std_logic := '0';
begin

-- State Register / Output DFF
process (clk, reset)
begin
     if (reset = '1') then
        statereg <= idle;
        str_output_next <= '0';
     elsif (clk'event and clk = '1') then
        statereg <= statenext;
        str_output_next <= data_bit;
     end if;
end process;

-- Next State Logic
process(statereg, reset, enable)
begin
    case statereg is
        when idle =>
            if (reset = '0' and enable = '1') then
                statenext <= s0;
            else
                statenext <= idle;
            end if;
        when stop =>
            statenext <= stop; 
        when s0 =>
            statenext <= s1;
        when s1 =>
            statenext <= s2;
        when s2 =>
            statenext <= s3;
        when s3 =>
            statenext <= s4;
        when s4 =>
            statenext <= s5;
        when s5 =>
            statenext <= s6;
        when s6 =>
            statenext <= s7;
        when s7 =>
            statenext <= stop;
    end case;
end process;

-- Next Output Lookahead Logic
process(statenext)
begin
    case statenext is
        when idle =>
            data_bit <= '0';
        when stop =>
            data_bit <= '0'; 
        when s0 =>
            data_bit <= str_input(7);
        when s1 =>
            data_bit <= str_input(6);
        when s2 =>
            data_bit <= str_input(5);
        when s3 =>
            data_bit <= str_input(4);
        when s4 =>
            data_bit <= str_input(3);
        when s5 =>
            data_bit <= str_input(2);
        when s6 =>
            data_bit <= str_input(1);
        when s7 =>
            data_bit <= str_input(0);
    end case;
end process;


-- Output Logic     
str_output <=  (str_output_next xor clk) when (statenext = s0) or (statenext = s1)
                                            or (statenext = s2) or (statenext = s3)
                                            or (statenext = s4) or (statenext = s5)
                                            or (statenext = s6) or (statenext = s7) 
                                            else '0';

end Behavioral;
