library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FullAdderSim is
-- Port ( );
end FullAdderSim;

architecture Behavioral of FullAdderSim is
    signal A : std_logic_vector(3 downto 0);
    signal B : std_logic_vector(3 downto 0);
    signal sum : std_logic_vector(3 downto 0);
    signal carry : std_logic;
begin

p0:entity work.FullAdder(Behavioral) port map(A=>A,b=>b,sum=>sum,carry=>carry);
process
begin
     wait for 100ns;
     A <= "0000";
     B <= "0010";
     wait for 50ns;
     A <= "1000";
     B <= "1110";
     wait for 50ns;
     A <= "0000";
     B <= "0010";
     wait for 50ns;
     A <= "0000";
     B <= "1111";
     wait for 50ns;
     A <= "1000";
     B <= "0010";
     wait for 50ns;
     A <= "0011";
     B <= "0010";
     wait for 50ns;
     A <= "0111";
     B <= "0010";
     wait for 50ns;
     end process;
end Behavioral;
