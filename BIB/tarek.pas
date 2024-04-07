program tarek;

uses wincrt,BIB01;
var N,ND:integer;
begin
								 write('donner un nombre N : ');
								 readln(N);
								 readln(ND);
								 N:=decal(N,ND);
								 writeln(N);
end.