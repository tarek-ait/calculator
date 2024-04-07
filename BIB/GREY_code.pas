program code_grey;
uses wincrt,BIB01;
var N,i,x:integer;
begin
readln(N);
writeln('Decimal');
writeln('-------');
for i := 1 to N do
begin
write(i,' ,');
end;
writeln;
writeln;
writeln('Binaire pur');
writeln('-----------');
for i := 1 TO N Do
begin
write(base1tobase2(i,10,2),' ,');
end;
writeln;
writeln;
writeln('Binaire reflichi (Code Grey)');
writeln('----------------------------');
x:=1;
for i := 1 to N do
begin
write(x,' ,');
x:=Codegrey(x);
end;


end.