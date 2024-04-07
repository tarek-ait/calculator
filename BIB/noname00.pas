Program tarek;
Uses Wincrt,BIB01,BIB02;
Var
  CN,code: String;
  N,d,p: LongInt;
Begin
  Write('number : ');
  Readln(N);
	p:=9;
  Repeat
    d := N Mod 10;
		code:='';
    Repeat
      code := '.'+ code;
      d := d-1;
    Until d < 0;
    cn := '*'+code+CN;
		N:=N div 10;
		p:=p-1
  Until (N = 0) and (p = 0);
  Writeln(CN+'#');
End.