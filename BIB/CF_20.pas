Program tarek;
Uses Wincrt,BIB02;
Type
  table = Array[tind] Of String[15];
  res = Record
    mot : String;
    l,c: Integer;
    sens: String;
  End;
  tab = Array[tind] Of res;
  objet = Record
    grille : table;
    t: tab;
  End;
Var
gr:table;
  O: objet;
  R: res;
  N,i: Integer;
  T1: tab;
	word,se:string;
	li,co:integer;
Procedure writegrille(gr:table);
Var
  i,j: Integer;
Begin
  For i:=1 To 15 Do
    Begin
      For j:=1 To 15 Do
        Write(Gr[i,j],'|');
      Writeln;
    End;
End;
Procedure readgrille(Var Gr:table);
Var
  i,j: Integer;
Begin
  Gr[1] := 'SENIHTNAXANTHIE';
  Gr[2] := 'EBTEIOMYIITIOTX';
  Gr[3] := 'SAUVTOIMPRMOTUA';
  Gr[4] := 'SREAUOPAHAEEUAT';
  Gr[5] := 'EAGRCORAOESLNRM';
  Gr[6] := 'UEEORTBBIECSLIS';
  Gr[7] := 'NUPTIILADIBTIEE';
  Gr[8] := 'XEACLAETILICAFS';
  Gr[9] := 'SNULLSEREITNERS';
  Gr[10] := 'TLEAESETNETNOCE';
  Gr[11] := 'EURMTNEMELPMOCN';
  Gr[12] := 'RGUETSIALEDROBI';
  Gr[13] := 'EETUECLAYONNAGE';
  Gr[14] := 'RSARSREEXAMINEN';
  Gr[15] := 'STNATUBEDUTILOS';
End;
Procedure sensdroite(Gr:table;Var mot:String;Var l,c:Integer; Var s:String);
Var
  k,i,j: Integer;
  trouve: Boolean;
  savei,savej,savejj: Integer;
Begin
  trouve := False;
  For i := 1 To 15 Do
    Begin
      For j:=1 To 15 Do
        Begin
          If Gr[i,j] = Upcase(mot[1]) Then
            Begin
              savei := i;
              savej := j;
              savejj := savej;
              k := 1;
              Repeat
                savejj := savejj+1;
                k := k+1;
                If Gr[i,savejJ] = Upcase(mot[k]) Then
                  trouve := True
                Else
                  trouve := False;
              Until (trouve = False) Or (k>=Length(mot));
            End;
        End;
    End;
  If trouve Then
    Begin
      l := savei;
      c := savej;
      S := 'D'
    End;
End;
Procedure sensbas(Gr:table;Var mot:String;Var l,c:Integer; Var s:String);
Var
  k,i,j: Integer;
  trouve: Boolean;
  savei,savej,saveii: Integer;
Begin
  trouve := False;
  For i := 1 To 15 Do
    Begin
      For j:= 1 To 15 Do
        Begin
          If Gr[i,j] = Upcase(mot[1]) Then
            Begin
              savei := i;
              savej := j;
              saveii := savei;
              k := 1;
              Writeln;
              Repeat
                saveii := saveii+1;
                k := k+1;
                If Gr[saveii,j] = Upcase(mot[k]) Then
                  trouve := True
                Else
                  trouve := False;
              Until (trouve = False) Or (k>=Length(mot));
              If trouve Then
                Begin
                  l := savei;
                  c := savej;
                  S := 'B'
                End;
            End;
        End;
    End;
End;
Procedure sens1D(Gr:table;Var mot:String;Var l,c:Integer; Var s:String);
Var
  k,i,j: Integer;
  trouve: Boolean;
  savei,savej,saveii,savejj: Integer;
Begin
  trouve := False;
  For i := 1 To 15 Do
    Begin
      For j:= 1 To 15 Do
        Begin
          If Gr[i,j] = Upcase(mot[1]) Then
            Begin
              savei := i;
              savej := j;
              saveii := savei;
              savejj := savej;
              k := 1;
              Repeat
                saveii := saveii+1;
                savejj := savejj+1;
                k := k+1;
                If Gr[saveii,savejj] = Upcase(mot[k]) Then
                  trouve := True
                Else
                  trouve := False;
              Until (trouve = False) Or (k>=Length(mot));
              If trouve Then
                Begin
              
                    l := savei;
                    c := savej;
                    S := '1D'
            
                End;
            End;
        End;
    End;
End;
Procedure sens2D(Gr:table;Var mot:String;Var l,c:Integer; Var s:String);
Var
  k,i,j: Integer;
  trouve: Boolean;
  savei,savej,saveii,savejj: Integer;
Begin
  trouve := False;
  For i := 1 To 15 Do
    Begin
      For j:= 1 To 15 Do
        Begin
          If Gr[i,j] = Upcase(mot[1]) Then
            Begin
              savei := i;
              savej := j;
              saveii := savei;
              savejj := savej;
              k := 1;
              Repeat
                saveii := saveii-1;
                savejj := savejj+1;
                k := k+1;
                If Gr[saveii,savejj] = Upcase(mot[k]) Then
                  trouve := True
                Else
                  trouve := False;
              Until (trouve = False) Or (k>=Length(mot));
              If trouve Then
                Begin
                
                    l := savei;
                    c := savej;
                    S := '2D'
            
                End;
            End;
        End;
    End;
End;
Begin

 readgrille(gr);
 O.grille:=gr;
 Write('Donner le nombre des mots : ');
 Readln(N);
  With O Do
    Begin
      For i:=1 To N Do
        Begin
              Writeln;
              Write('Donner votre mot slv : ');
              Readln(T1[i].mot);
              sensdroite(grille,T1[i].mot,T1[i].l,T1[i].c,T1[i].sens);
              If T1[i].sens <> 'D' Then
                sensbas(grille,T1[i].mot,T1[i].l,T1[i].c,T1[i].sens)
              Else If T1[i].sens <> 'B' Then
                     sens1D(grille,T1[i].mot,T1[i].l,T1[i].c,T1[i].sens)
              Else
                sens2D(grille,T1[i].mot,T1[i].l,T1[i].c,T1[i].sens);
              Writeln('les cordonnes de ''',T1[i].mot,''' sont :',T1[i].l,',',T1[i].c,' et son sens et ',T1[i].sens);
            End;
        End;
    
End.
