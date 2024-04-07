program fr;
uses wincrt;
var N,NF:integer;

Function freq(N,x:integer):integer;
var d,fr:integer;
begin
fr:=0;
repeat
d :=  N mod 10;
if d = x then
fr:=fr+1;
	N:=N div 10
until N = 0;
freq:=fr;
end;
begin
readln(N);
NF:=freq(N,1);
writeln(NF);
end.