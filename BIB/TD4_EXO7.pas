Program tarek;
Uses Wincrt,crt,BIB02;
Type
  jour = Record
    date : String[8];
    table : tab1D ;
  End;
  semaine = Array[1..7] Of jour;
Var
  V: tab1D;
  J: jour;
  T: semaine;
  tai: tind;
  i,k,hour: Integer;
  dat,day : String;
Procedure Aleattable( Var T:tab1D);
Var
  min,max: Integer;
  i: Integer;
Begin
  tai := 24;
  min := -10;
  max := 50;
  Randomize;
  For i:= 1 To tai Do
    T[i] := min + Random((max-min)+1);
End;
Procedure tempmoy(Var t:semaine;Var j:jour;Var dat:String);
Var
  i,tempT,savei: Integer;
  trouve: Boolean;
Begin
  Write('donner la date : ');
  Readln(dat);
  tempt := 0;
  i := 1;
  trouve := False;
  With j Do
    Begin
      Repeat
        If T[i].date = dat Then
          Begin
            trouve := True;
            savei := i;
          End;
        i := i+1;
      Until (trouve = True) Or (i > 7) ;
    End;
  With j Do
    Begin
      If trouve Then
        Begin
          V := T[savei].table;
          For i:=1 To 24 Do
            Begin
              tempT := V[i] + tempT;
            End;
          Writeln('la temperateure moyenne de le jour ',T[savei].date,' est : ',(tempt/24): 2: 2);
        End;
    End;
End;
Procedure temphj(var t:semaine; var j :jour;var day:string;var hour:Integer);
var trouveday,trouvehour:boolean;
i,savei,temp:integer;
V:tab1D;
Begin
write('donner le jour de cet semaine : ');
  Readln(day);
	write('denner l''heure : ');
  Readln(hour);
	trouveday:=false;
	trouvehour:=false;
  With j Do
    Begin
      For i := 1 To 7 Do
        Begin
          If day = T[i].date Then
            savei := i;
          trouveday := True;
        End;
    End;
  V := T[savei].table;
	with j do
	begin
  For i := 1 To 24 Do
    Begin
      If hour = i Then
        Begin
          trouvehour := True;
          temp := V[i];
        End;
    End;
		  If (trouveday) And (trouvehour)Then
        Writeln('la temperateure de le day ',day,' est ',temp);
		end;
End;
Begin
  tai := 24;
  With j Do
    Begin
      For i := 1 To 7 Do
        Begin
          Write('la date : ');
          Readln(T[i].date);
          Writeln('le tableau des tempirateures : ');
          aleattable(T[i].table);
        End;
    End;
  With J Do
    Begin
      For i := 1 To 7 Do
        Begin
          Writeln('la date : ',T[i].date);
          Write('le tableau des temperateurs : ');
          write1D(T[i].table,tai);
          Writeln
        End;
    End;
  tempmoy(T,j,dat);
	temphj(T,j,day,hour);
End.