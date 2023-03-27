library ieee;
use ieee.std_logic_1164;
use ieee.std_logic_unsigned;

entity agenda is
	port(clk:in bit; rst:in bit;ctrl:in bit;
	ora_i, min_i, sec_i: in integer;
	an_i, luna_i, zi_i:in integer;
	sapt_i:in integer;
	temp_i:in integer;
	ora_o, min_o, sec_o: out integer;
	an_o, luna_o, zi_o:out integer;
	sapt_o:out integer;
	temp_o:out integer);
end entity;



architecture arhi of agenda is

component data is
	port(clk , rst, ctrl:in bit;
	an_i, luna_i, zi_i: in integer;
	an_o, luna_o, zi_o: out integer;
	inc_zi:in bit);
end component;

component orarul is
	Port(clk , rst, ctrl:in bit;
	ora_i, min_i, sec_i: in integer;
	ora_o, min_o, sec_o: out integer;
	fin_zi:out bit);
end component;

component sapte is
	Port(clk, rst, ctrl: in bit;
	sapt_i:in integer;
	sapt_o:out integer;
	inc_zi:in bit);
end	component; 

component vreme is
	Port(clk, rst, ctrl:in bit;
	temp_i:in integer;
	temp_o:out integer);
end component;

signal oraa, mina, seca, ana, lunaa, zia, sapta:integer;
signal temp:integer;
signal ok:integer:=1;
signal finzi, inczi:bit;

begin

Ceas: orarul port map (clk=>clk, rst=>rst, ctrl=>ctrl, ora_i=>ora_i, min_i=>min_i, sec_i=>sec_i, ora_o=>oraa, min_o=>mina, sec_o=>seca, fin_zi=>finzi);
Date: data port map	(clk=>clk , rst=>rst, ctrl=>ctrl, an_i=>an_i, luna_i=>luna_i, zi_i=>zi_i, an_o=>ana, luna_o=>lunaa, zi_o=>zia, inc_zi=>inczi);
Vremuri: vreme port map(clk=>clk, rst=>rst, ctrl=>ctrl, temp_i=>temp_i, temp_o=>temp_o);
Sapt: sapte port map(clk=>clk, rst=>rst, ctrl=>ctrl, sapt_i=>sapt_i, sapt_o=>sapta, inc_zi=>inczi);



inczi<=finzi;
ora_o<=oraa;
min_o<=mina;
sec_o<=seca;
an_o<=ana;
luna_o<=lunaa;
zi_o<=zia;
sapt_o<=sapta;

	
	
end architecture;	