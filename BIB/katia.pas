Program tarek;
Uses Wincrt;
Var
  name: String;

Procedure UpcaseT(Var name:String);
Var
  i: Integer;
Begin
  Begin
    For i:=1 To Length(name) Do
      Begin
        name[i] := Upcase(name[i]);
      End;
  End;
End;
Begin
  Write('name : ');
  Readln(name);
  UpcaseT(name);
	writeln;
  Writeln('name : ',name);
End.
