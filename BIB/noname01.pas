program tarek;
uses wincrt,BIB02;
var name1:string;
begin
write('name : ');
readln(name1);
name1:=copy(name1,7,5);
writeln(name1);
end.