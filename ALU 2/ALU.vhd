library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
port (Clock: in std_logic;
		A,B : in unsigned (7 downto 0);
		OP : in unsigned (15 downto 0);
		Neg : out std_logic;
		R1: out unsigned (3 downto 0);
		R2 : out unsigned (3 downto 0));
END ALU;

architecture calculation of ALU is 
signal Reg1, Reg2, Result : unsigned (7 downto 0) :=(others =>'0');
signal Reg4 : unsigned (0 to 7);

begin 
Reg1 <= A;
Reg2 <= B;

process (Clock, OP)
begin 
	if (rising_edge (Clock)) THEN 
		case OP is 
			WHEN "0000000000000001" =>
				--Increment A by 2
				 Result <= Reg1 + "00000010";
				
			WHEN "0000000000000010" =>
				--Shift B to right by two bits, input bit = 0 (SHR)
				Result <= ("00" & Reg2(7 downto 2));
				
			WHEN "0000000000000100" =>
				--Shift A to right by four bits, input bit = 1 (SHR)
				Result <= ("1111" & Reg1(7 downto 4));
	
			WHEN "0000000000001000" =>
				--Find the smaller value of A and B and produce the results ( Min(A,B) )
				if (Reg1 < Reg2) 
					then Result <= Reg1; 
				else Result <= Reg2; 
				end if;
				
			WHEN "0000000000010000" =>
				--Rotate A to right by two bits (ROR)
				Result <= (Reg1(1 downto 0) & Reg1(7 downto 2));

			WHEN "0000000000100000" =>
				--Invert the bit-significance order of B
				Result <= (Reg1(0) & Reg1(1) & Reg1(2) & Reg1(3) & Reg1(4) & Reg1(5) & Reg1(6) & Reg1(7));
				
			WHEN "0000000001000000" =>
				--Produce the result of XORing A and B
				Result <= Reg1 xor Reg2;

			WHEN "0000000010000000" =>
				--Produce the summation of A and B, then decrease it by 4
				Result <= (Reg1 + Reg2) - "00000100";

			WHEN "0000000100000000" =>
				--Produce all high bits on the output
				Result <= "11111111";

			WHEN OTHERS =>
				--Don't care, do nothing
				Result <= NULL;
		end case;
	end if;
end process;

R1 <= Result (3 downto 0);
R2 <= Result (7 downto 4);
end calculation;
			
			
		