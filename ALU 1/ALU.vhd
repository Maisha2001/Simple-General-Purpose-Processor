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
				--Addition for Reg1 and Reg 2
				Result <= (Reg1 + Reg2);
				
			WHEN "0000000000000010" =>
				--Subtraction for Reg1 and Reg2; neg bit is required
				IF (Reg1>Reg2) THEN
					Neg <='0';
					Result <= (Reg1-Reg2)-(Reg1-Reg2);
				ElSIF (Reg1 < Reg2) THEN
					Neg <='1';
					Result <= (Reg1-Reg2)-NOT(Reg1-Reg2)+1;
				ELSE 
					Neg <= '1';
					Result <= (Reg1-Reg2)-NOT(Reg1-Reg2)+1;
				END IF;
				
			WHEN "0000000000000100" =>
				--Inverse
				Result <= (NOT Reg1);
				Result <= (NOT Reg2);
	
			WHEN "0000000000001000" =>
				--Boolean nand
				Result <= (Reg1 NAND Reg2);
				
			WHEN "0000000000010000" =>
				--Boolean nor
				Result <= (Reg1 NOR Reg2);
				
			WHEN "0000000000100000" =>
				--Boolean and 
				Result <= (Reg1 AND Reg2);
				
			WHEN "0000000001000000" =>
				--Boolean or
				Result <= (Reg1 OR Reg2);
				
			WHEN "0000000010000000" =>
				--Boolean xor
				Result <= (Reg1 XOR Reg2);
				
			WHEN "0000000100000000" =>
				--Boolean xnor
				Result <= (Reg1 XNOR Reg2);
				
			WHEN OTHERS =>
				--Don't care, do nothing
				Result <= NULL;
		end case;
	end if;
end process;

R1 <= Result (3 downto 0);
R2 <= Result (7 downto 4);
end calculation;
			
			
		