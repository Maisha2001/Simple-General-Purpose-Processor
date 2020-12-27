LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_unsigned.all ;

ENTITY sseg IS
	PORT ( bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0) ;
	neg: IN STD_LOGIC;
	leds, sign : OUT STD_LOGIC_VECTOR(0 TO 6)) ;
END sseg ;

ARCHITECTURE Behavior OF sseg IS
BEGIN
	PROCESS ( bcd, neg )
	BEGIN
		IF neg = '0' THEN
			sign <= ("0000000");
		ELSE 
			sign  <= ("0000001");
		END IF;
	
		CASE bcd IS
			WHEN "0000" => leds <=  ("1111110") ; --0
			WHEN "0001" => leds <=  ("0110000") ; --1
			WHEN "0010" => leds <=  ("1101101") ; --2
			WHEN "0011" => leds <=  ("1111001") ; --3
			WHEN "0100" => leds <=  ("0110011") ; --4
			WHEN "0101" => leds <=  ("1011011") ; --5
			WHEN "0110" => leds <=  ("1011111") ; --6
			WHEN "0111" => leds <=  ("1110000") ; --7
			WHEN "1000" => leds <=  ("1111111") ; --8
			WHEN "1001" => leds <=  ("1110011") ; --9
			
			WHEN "1010" => leds <=  ("1110111") ; --A
			WHEN "1011" => leds <=  ("0011111") ; --b
			WHEN "1100" => leds <=  ("1001110") ; --c
			WHEN "1101" => leds <=  ("0111101") ; --d
			WHEN "1110" => leds <=  ("1001111") ; --E
			WHEN "1111" => leds <=  ("1000111") ; --F
			WHEN OTHERS => leds <=  ("-------") ; 
		END CASE ;
		
	END PROCESS ;
END Behavior ;