Program nombre_dapparition;
Uses Wincrt;
Var
  N,d,saveN,i,NA: Integer;
Begin
  Write('donner un nombre N : ');
  read(N);
	saveN:= N;
for i := 0 to 9 Do
begin
NA:=0;
N :=saveN;
repeat
d:=  N mod 10;
if d=i then
NA:=NA+1;
N := N div 10;
until N = 0;
IF NA <> 0 then writeln(i+NA*10);
end;
end.