library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mux_2x1 is 
    Port ( in1 : in STD_LOGIC; 
           in2 : in STD_LOGIC; 
           sel : in STD_LOGIC; 
           output : out STD_LOGIC); 
end mux_2x1; 

architecture Behavioral of mux_2x1 is
begin

    process (in1, in2, sel)
    begin
        if (sel = '0') then
            output <= in1;
            else
            output <= in2;
        end if; 
    end process;

end Behavioral;
