program test_power;
var a,x:integer;
Function power(N:Integer;p:Integer): Integer;
Var
  NP: Integer;
Begin
  NP := 1;
  Repeat
    NP := N*NP;
    p := P-1;
  Until p=0;
  power := NP;
End;
begin
read(a,x);
writeln(power(a,x));
readln;
readln;

end.