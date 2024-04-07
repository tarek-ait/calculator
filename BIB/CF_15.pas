Program tarek;
Uses Wincrt,BIB02,BIB01;
var T2:tab2D;
TL,TC:tind;
i,N1,N2,F:integer;
Procedure suitefecondite(N:Integer;Var T:tab1D;Var tai:tind);
Var
  i: Integer;
  saveN: Integer;
Begin
  i := 1;
  T[1] := N;
  saveN := N;
  If (saveN Div 10) = 0 Then
    Begin
      Repeat
        saveN := saveN + saveN;
        i := i+1;
        T[i] := saveN;
      Until saveN Div 10 <> 0;
    End;
  Repeat
    i := i+1;
    saveN := saveN + prod(saveN);
    T[i] := saveN ;
  Until freq(saveN,0) <> 0;
  tai := i;
End;
Procedure partie1(Var N1:Integer);
Var
  T,Ti: tab1D;
  tai,taii: tind;
  i,savei,maxfecondite,feconditei: Integer;
Begin
  Write('PARTIE 1 : ');
  Writeln('recherche d''un nombre (<N1) le plus fecond aisi que sa fecondite');
  Writeln('*******');
  Write('Donner N1 : ');
  Readln(N1);
  suitefecondite(N1,T,tai);
  maxfecondite := tai;
  For i:=1 To N1-1 Do
    Begin
      suitefecondite(i,Ti,taii);
      feconditei := taii;
      If feconditei > maxfecondite Then
        Begin
          maxfecondite := feconditei;
          savei := i;
        End;
    End;
  Writeln('Nombre Recherche :',savei,'    fecondite : ',maxfecondite);
  Writeln(

'----------------------------------------------------------------------------------------------------------'
  );
End;
Procedure partie2(Var N2,F:Integer);
Var
  i,k: Integer;
  taii: tind;
  Ti,V: tab1D;
Begin
  k := 0;
  Write('PARTIE 2 : ');
  Writeln('recherche des nombres (<N2) et ayant une fecondite donnee');
  Writeln('*******');
  Write('Donner N2: ');
  Readln(N2);
  Write('Dnner la fecondite : ');
  Readln(F);
  i := 1;
  For i :=1 To N2 Do
    Begin
      suitefecondite(i,Ti,taii);
      If taii = F Then
        Begin
          k := k+1;
          V[k] := i;
        End;
    End;
  Write('Les nombre < ',N2,' de fecondite = ',F,' sont : ');
  For i :=1 To k Do
    Begin
      Write(V[i],' ,');
    End;
  Writeln;
  Writeln(

'----------------------------------------------------------------------------------------------------------'
  );
End;

Procedure empty1D(Var T:tab1D;tai:tind);
Var
  i: Integer;
Begin
  For i:=1 To tai Do
    T[i] := 0;
End;

Procedure empty2D(Var T:tab2D;TL,TC:tind);
Var
  i,j: Integer;
Begin
  For i :=1 To TL Do
    For j:=1 To TC Do
      T[i,j] := 0;
End;

Procedure partie3(Var N2,i:Integer;Var T2:tab2D;Var TL,TC:tind);
Var
  N1,Ff,maxk: Integer;
  TN,V: tab1D;
  taiN: tind;
  N,k,c,l: Integer;
Begin
  TC := 1;
  maxk := 4;
  Readln(i);
  For FF := 1 To i Do
    Begin
      k := 1;
      For N := 1 To N2 Do
        Begin
          empty1D(TN,taiN);
          taiN := 1;
          suitefecondite(N,TN,taiN);
          If taiN = FF Then
            Begin
              k := k+1;
              V[k] := N;
            End;
        End;
      If k > maxk Then
        maxk := k;
      For c := 1 To maxk Do
        Begin
          T2[FF,c] := V[c];
          If c > k Then
            T2[FF,c] := 0;
        End;
    End;
  TL := i;
  TC := maxk;
  write2D(T2,TL,TC);
End;
Begin      
partie1(N1);
partie2(N2,F);
partie3(N2,i,T2,TL,TC);

End.
