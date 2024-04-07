Program tarek;
Uses Wincrt,BIB01;
var ph1,ph2:string;
procedure crypt(ph:string;var ph2:string);
Var
  R,min,ch,k,i,max: Integer;
  d,c: Char;
Begin
  Repeat
    Clrscr;
    Write('ph : ');
    Readln(ph);
    Write('max : ');
    Readln(max);
    Write('min : ');
    Readln(min);
    Repeat
      R := min + Random((max-min)+1);
    Until premier(R);
    Writeln(R);
    ph2 := '';
    k := 0;
    Repeat
      k := k+1;
      d := ph[k];
      ch := Ord(d)+R;
      c := Chr(ch);
      ph2 := ph2+c;
    Until k=Length(ph);
    Writeln(ph2);
  Until Readkey=Chr(27);
	end;
	Begin
	 write('ph1 : ');
	 readln(ph1);
	 crypt(ph1,ph2);
	 writeln(ph2);
  End.