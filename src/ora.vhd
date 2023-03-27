library ieee;
use ieee.std_logic_1164;
use ieee.std_logic_unsigned;

entity orarul is
	Port(clk , rst, ctrl:in bit;
	ora_i, min_i, sec_i: in integer;
	ora_o, min_o, sec_o: out integer;
	fin_zi:out bit);
end entity;

architecture ceasu of orarul is

signal ora, min, sec:integer;
signal zifull: bit;
signal ok:integer:=1;
begin
	process(clk, rst, ctrl)
	begin
		if ok=1 then
		ora<=0;
		min<=0;
		sec<=0;
		ok<=0;
		end if;
		
		if rst='1' then
		
		ora<=0;
		min<=0;
		sec<=0;
		
		elsif ctrl='1' then
		
		ora<=ora_i;
		min<=min_i;
		sec<=sec_i;
		
		elsif (clk='1' and clk'event) then
			sec<=sec+1;
			zifull<='0';
			if sec>58 then
				sec<=0;
				min<=min+1;
				if min>58 then
					min<=0;
					ora<=ora+1;
					if ora>22 then
						ora<=0;
						zifull<='1';
					end if;
				end if;
			end if;
		
		end if;

	end process;
	ora_o<=ora;
	min_o<=min;
	sec_o<=sec;
	fin_zi<=zifull;
	
end architecture;