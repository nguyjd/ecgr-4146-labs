library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity m_counter is
    generic (mod_m: positive := 3 );
    port (  clk, reset: in std_logic;
            m: in std_logic_vector(mod_m downto 0);
            q: out std_logic_vector(mod_m downto 0));
end m_counter;

architecture Behavioral of m_counter is
signal r_next, r_reg, r_inc: unsigned(mod_m downto 0) := (others => '0');
begin

-- D FF Memory
process(clk, reset)
begin

    if (reset = '1') then
        r_reg <= (others => '0');
    elsif (clk'event and clk = '1') then
        r_reg <= r_next;
    end if;

end process;

-- Next-State Logic
r_inc <= r_reg + 1;
r_next <= (others => '0') when (unsigned(m) = r_inc) else r_inc;

-- Output
q <= std_logic_vector(r_reg);

end Behavioral;
