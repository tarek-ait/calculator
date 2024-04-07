program TD3;
uses wincrt,BIB01;
var N,NB,d,cd:integer;
begin
															write('Donner un nombre N : ');
															readln(N);
															NB:=base1tobase2(N,10,2);
															writeln(NB);
															cd :=0;
															repeat
															d := NB div 10 ;
															if d = 1 then
															cd := 1 + cd;
															NB := NB div 10;
															until NB = 0;
															writeln(cd);
end.