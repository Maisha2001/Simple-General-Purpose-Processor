library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
port (Clock: in std_logic;
		A,B : in unsigned (7 downto 0);
		student_id : in unsigned (3 downto 0);
		OP : in unsigned (15 downto 0);
		Result : out unsigned (3 downto 0));
END ALU;

architecture calculation of ALU is 
signal Reg1, Reg2 : unsigned (7 downto 0) :=(others =>'0');
signal Reg4 : unsigned (0 to 7);
begin 

process (Clock, OP)
begin 
	if (rising_edge (Clock)) THEN 
		case OP is 
			--For each microcode instruction, 'y' if one of the 2 digits of A are less than FSM output(student_id)
			--and 'n' otherwise.
			WHEN "0000000000000001" =>
				if (student_id > A (7 downto 4)) or (student_id > A (3 downto 0)) then 
					Result <= "1111"; --y
				else
					Result <= "0000"; --n
				end if;
				
			WHEN "0000000000000010" =>
				if (student_id > A (7 downto 4)) or (student_id > A (3 downto 0)) then 
					Result <= "1111"; --y
				else
					Result <= "0000"; --n
				end if;
				
			WHEN "0000000000000100" =>
				if (student_id mod 2) = 0
					then Result <= "1111"; --even result
				else Result <= "0000"; --odd result
				end if;
	
			WHEN "0000000000001000" =>
				if (student_id mod 2) = 0
					then Result <= "1111"; --even result
				else Result <= "0000"; --odd result
				end if;			
				
			WHEN "0000000000010000" =>
				if (student_id > A (7 downto 4)) or (student_id > A (3 downto 0)) then 
					Result <= "1111"; --y
				else
					Result <= "0000"; --n
				end if;
				
			WHEN "0000000000100000" =>
				if (student_id > A (7 downto 4)) or (student_id > A (3 downto 0)) then 
					Result <= "1111"; --y
				else
					Result <= "0000"; --n
				end if;
				
			WHEN "0000000001000000" =>
				if (student_id > A (7 downto 4)) or (student_id > A (3 downto 0)) then 
					Result <= "1111"; --y
				else
					Result <= "0000"; --n
				end if;
				
			WHEN "0000000010000000" =>
				if (student_id > A (7 downto 4)) or (student_id > A (3 downto 0)) then 
					Result <= "1111"; --y
				else
					Result <= "0000"; --n
				end if;
				
			WHEN "0000000100000000" =>
				if (student_id > A (7 downto 4)) or (student_id > A (3 downto 0)) then 
					Result <= "1111"; --y
				else
					Result <= "0000"; --n
				end if;
				
			WHEN OTHERS =>
				--Don't care, do nothing
				Result <= NULL;
		end case;
	end if;
end process;
end calculation;
			
			
		