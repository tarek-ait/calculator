Program codegre;
Uses Wincrt,BIB01;
var N,i,x:integer;

Begin
writeln('Affichage des X nombres de gray');
writeln('-------------------------------');
  Write('Donner le nombre de X : ');
  Readln(N);
	writeln;
  Writeln('Decimal');
  Writeln('-------');
  For i := 1 To N Do
    Begin
      Write(i,' ,');
    End;
  Writeln;
  Writeln;
  Writeln('Binaire pur');
  Writeln('-----------');
  For i := 1 To N Do
    Begin
      Write(base1tobase2(i,10,2),' ,');
    End;
  Writeln;
  Writeln;
  Writeln('Binaire reflichi (Code Grey)');
  Writeln('----------------------------');
  x := 1;
  For i := 1 To N Do
    Begin
      Write(x,' ,');
      x := Nextgrey(x);
    End;
End.