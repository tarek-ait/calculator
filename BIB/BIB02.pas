
Unit BIB02;
Interface
Uses Wincrt,crt,BIB01;
Const max = 100;
  //  maxl = 100;
  //  maxC = 100;
Type
  tind = 1..max;
  // 1
  TAB1D = Array[tind] Of Integer ;
  TAB2D = Array[tind,tind] Of Integer ;
  tab = Array[tind,tind] Of Real;
  //************************** Modules  **************************************//
Procedure permut(Var A,B:Integer);
Function NebV(T:TAB1D;Tai:tind;V:Integer): Integer;
Function minTAB1D(Var T:TAB1D;Var tai:tind ): Integer;
Function maxTAB1D(Var T:TAB1D;Var tai:tind ): Integer;
Function RechDichV(T:TAB1D;tai:tind;V:Integer): Boolean;
Function minind1D( T:TAB1D; B1,B2:Integer): Integer;
Function maxTAB2D( T:TAB2D; NBL,NBC:tind): Integer;
Function minTAB2D(T:TAB2D; NBL,NBC:tind): Integer;
Function mincolo(T:tab2D;TL:tind;j:Integer): Integer;
Function maxligne(T:tab2D;TC:tind;i:Integer): Integer;
Function freqlig(T:tab2D;TC,i:tind;d:Integer): Integer;
Function freqrec(T:tab2D;a,b,c,d:Integer;N:Integer): Integer;
Function freqcol(T:tab2D;Tl,j:tind;d:Integer): Integer;
Function region(T:tab2D; i:Integer): Integer;
Function determ3(A:tab2D;TL,TC:tind): Integer;
Function matriceinverse2carr(T:tab2D; TL,TC:tind): tab;
Function determ2(T:tab2D;TL,TC:tind): Real;
Procedure minind2D(Var T:TAB2D;NBL,NBC:tind);
Procedure read1D(Var T:TAB1D; Var Tai:tind);
Procedure write1D(Var T:TAB1D; Var Tai:tind );
Procedure Aleat1D( Var T:tab1D; Var tai:tind);
Procedure tri_selection(T:TAB1D;tai:tind);
Procedure tri_bulles(Var T:tab1D; tai:tind);
Procedure tri_compt(T : tab1D ;tai:tind);
Procedure tri_insertion(Var T:tab1D; tai :tind);
Procedure read2D(Var T:Tab2D; Var NBL:Tind; Var NBC:Tind);
Procedure write2D(T:tab2D;NBl:Tind;NBC:Tind);
Procedure SomCol( Var T:tab2D; NBL:tind; NBC:tind ;Var SCOL:Tab1D);
Procedure ALEAT2D(Var T:TAB2D;Var NBL,NBC:tind);
Procedure pointdeselle(T:tab2D;TL,TC:tind;Var PS :Integer;Var savei,savej:Integer);
Procedure transpo(T:tab2D;TL,TC:tind);
Procedure ajouteligne(Var A:tab2D; Var TL,TC:tind; N:tind);
Procedure Romplcol(Var A:tab2D; TLA,NC:Integer; B:tab2D;TLB:Integer;NCB:tind);
Procedure Solve3eq(Var A:tab2D; Var TLA,TCA:tind; Var B:tab2D; Var TLB,TCB:tind);
Procedure produitmatricielle(A:tab2D;LA,CA:tind;B:tab2D;LB,CB:tind;Var P:tab2D;Var LP,CP:tind );
// TP 16
// atelier 1
Procedure Findfibo(V:tab1D;tai:tind;Var T:tab1D; Var taiT:tind);
Procedure D2(V:tab1D;tai:tind;Var V2:tab1D;Var taiV2:tind);
Procedure partieA(V:tab1D;tai:tind;Var T:tab2D;Var TL,TC:tind);
//***************************************************************************//
// atelier 3
Procedure compres(V:tab1D;tai:tind;Var C:tab1D;Var taic:tind);
Procedure convert2Dto1D(T:tab2D;TL,TC:tind;Var V:tab1D;Var tai:tind);
Procedure decompres(C:tab1D;taic:tind;Var V:tab1D; Var tai:tind);
Procedure convert1Dto2D(V:tab1D;tai:tind;Var A:tab2D;Var TL,TC:tind);
//***************************************************************************//
Implementation
// --------------- READING THE ELEMENTS OF A TABLE OF INTEGERS --------------
Procedure read1D(Var T:TAB1D; Var Tai:tind);
Var
  i: Integer;
Begin
  Write('Donner la taille de vecteur : ');
  Readln(tai);
  Writeln('---------------------------');
  Writeln('doner les valeures du tableau : ');
  Writeln;
  For i:=1 To tai Do
    Begin
      Write('[',i,'] = : ');
      Readln(T[i]);
    End;
End;
// ----------- display the elements of one demenssion table -----------------
Procedure write1D(Var T:TAB1D; Var Tai:tind );
Var
  i: Integer;
Begin
  For i:= 1 To tai Do
    Write(t[i],' | ');
End;
// --------------------------------------------------------------------------
// -------------- the appearance for a given number in a table --------------
Function NebV( T:TAB1D ; Tai:tind; V : Integer): Integer;
Var
  Cpt,i: Integer;
Begin
  cpt := 0;
  For i := 1 To Tai Do
    Begin
      If T[i] = V Then
        cpt := cpt+1;
    End;
  NebV := cpt;
End;
// --------------------------------------------------------------------------
// ------------- filling up a one demenssion table randomly -----------------
Procedure Aleat1D( Var T:tab1D; Var tai:tind);
Var
  min,max: Integer;
  i: Integer;
Begin
  Write('give the capacity of the table : ');
  Readln(tai);
  Writeln;
  Writeln('the interval [min;max] is to fill up the one dimenssion table randomly');
  Writeln('----------------------------------------------------------------------');
  Writeln;
  Write('give the infimum border : ');
  Readln(min);
  Writeln;
  Write('give the supremum border : ');
  Readln(max);
  Randomize;
  For i:= 1 To tai Do
    T[i] := min + Random((max-min)+1);
End;
// --------------------------------------------------------------------------
// ----------------- give the smallest element of the table T ----------------
Function minTAB1D(Var T:TAB1D;Var tai:tind ): Integer;
Var
  i : Integer ;
  min: Integer;
Begin
  min := T[1] ;
  For i := 1 To tai Do
    Begin
      If T[i] < min Then
        min := T[i] ;
    End;
  minTAB1D := min;
End;
// --------------------------------------------------------------------------
// ---------------- give the biggest element  of the table T ------------------
Function maxTAB1D(Var T:TAB1D;Var tai:tind ): Integer;
Var
  i : Integer ;
  max: Integer;
Begin
  max := T[1];
  For i := 1 To tai Do
    Begin
      If T[i] > max Then
        max := T[i] ;
    End;
  maxTAB1D := max;
End;
// --------------------------------------------------------------------------
// -------- indice de l'elem petit dans une portion d'un tableau ------------
Function minind1D( T:TAB1D; B1,B2:Integer): Integer;
Var
  i,ind: Integer;
Begin
  ind := B1;
  For i := B1+1 To B2 Do
    Begin
      If T[i] < T[ind] Then
        Begin
          ind := i;
        End;
    End;
  minind1D := ind;
End;
// --------------------------------------------------------------------------
// ------------------------- Permutation de deux nombres---------------------
Procedure permut(Var A,B:Integer);
Var
  x : Longint ;
Begin
  x := A;
  A := B;
  B := x;
End;
// --------------------------------------------------------------------------
// ------------------ Trie par la methode de selection ----------------------
Procedure tri_selection(T:TAB1D;tai:tind);
Var
  i,pr,save: Integer;
Begin
  For i := 1 To tai Do
    Begin
      pr := minind1D(T,i,tai);
      save := T[i];
      T[i] := T[pr];
      T[pr] := save;
    End;
  Writeln;
  Writeln('tableau trie par la methode de selection  : ');
  Writeln('-------------------------------------------');
  Writeln;
  write1D(T,tai);
End;
// --------------------------------------------------------------------------
// ------------------ Trie par la methode des boulles -----------------------
Procedure tri_bulles(Var T:tab1D; tai:tind);
// version amelioree
Var
  permutation : Boolean;
  i: Integer;
  x: tind;
Begin
  x := tai;
  Repeat
    permutation := False;
    x := x - 1;
    For i := 1 To x Do
      Begin
        If T[i] > T[i+1] Then
          Begin
            permut(T[i],T[i+1]);
            permutation := True ;
          End;
      End;
  Until permutation = False ;
  Writeln;
  Writeln('tableau trie par la methode de boulle  : ');
  Writeln('-------------------------------------------');
  Writeln;
  write1D(T,tai);
End;
// --------------------------------------------------------------------------
// ------------ Recherche d'un element dans un tableau tire -----------------
Function RechDichV(T:TAB1D;tai:tind;V:Integer): Boolean;
Var
  mil,max,min: Integer;
  trouv: Boolean;
Begin
  trouv := False;
  min := 1 ;
  max := tai;
  If V = T[tai] Then
    trouv := True
  Else
    Begin
      While (min < max) Do
        Begin
          mil := (max + min) Div 2 ;
          If V > t[mil] Then
            min := mil + 1
          Else
            max := mil;
          If V = T[mil] Then
            trouv := True;
        End;
    End;
  RechDichV := trouv
End;
// --------------------------------------------------------------------------
// ----------------- Reading a table of 2 demension -------------------------
Procedure read2D(Var T:Tab2D; Var NBL:Tind; Var NBC:Tind);
Var
  i,j: Integer;
Begin
  Write('Donner le nombres de lignes du tableau : ');
  Readln(NBL);
  Write('Donner le  nombres de colonnes du tableau : ');
  Readln(NBC);
  For i := 1 To Nbl Do
    Begin
      For j := 1 To NBC Do
        Begin
          Write('[',i,',',j,'] = ');
          Read(T[i,j]);
        End;
    End;
End;
// --------------------------------------------------------------------------
// ----------------- Writiing a table of two demensions ---------------------
Procedure write2D(T:tab2D;NBl:Tind;NBC:Tind);
Var
  i,j: Integer;
Begin
  For i:=1 To NBL Do
    Begin
      For j:=1 To NBC Do
        Begin
          If T[i,j] = 1 Then
            textcolor(white);
          Write(T[i,j]:8,' | ');
          If j = NBC Then
            Writeln;
        End;
    End;
End;
// --------------------------------------------------------------------------
// ----------------- Calculating the sum of each collone --------------------
Procedure SomCol( Var T:tab2D; NBL:tind; NBC:tind ;Var SCOL:Tab1D);
// calculate the sum of each lign in a two demesnsion table and display it in one demension table
Var
  i,j,SOMC: Integer;
Begin
  For J:=1 To NBC Do
    Begin
      SOMC := 0;
      For I:=1 To NBL Do
        Begin
          SOMC := SOMC+T[i,j];
        End;
      SCOL[J] := SOMC;
    End;
  write1D(SCOL,NBC);
End;
// --------------------------------------------------------------------------
// --------- finding the biggest element of a two demension table -----------
Function maxTAB2D(T:TAB2D; NBL,NBC:tind): Integer;
Var
  max,i,j: Integer;
Begin
  max := T[1,1];
  For i :=1 To NBL Do
    Begin
      For j:=1 To NBC Do
        If T[i,j] > max Then
          max := T[i,j]
    End;
  maxTAB2D := max;
End;
// --------------------------------------------------------------------------
// -------- finding the smallest element of a two demension table -----------
Function minTAB2D(T:TAB2D; NBL,NBC:tind): Integer;
Var
  min,i,j: Integer;
Begin
  min := T[1,1];
  For i :=1 To NBL Do
    Begin
      For j:=1 To NBC Do
        If T[i,j] < min Then
          min := T[i,j]
    End;
  minTAB2D := min;
End;
// --------------------------------------------------------------------------
// ------------- Filling up a two demension table randomly ------------------
Procedure ALEAT2D(Var t:tab2d;Var nbl,nbc:tind);
Var
  i,j,max,min: Integer;
Begin
  Write('donner le nombres de lignes du tableau : ');
  Readln(nbl);
  Write('donner le  nombres de colonnes du tableau : ');
  Readln(nbc);
  Writeln;
  Writeln('the interval [min;max] is to fill up the one dimenssion table randomly');
  Writeln('----------------------------------------------------------------------');
  Write('give the infimum border : ');
  Readln(min);
  Writeln;
  Write('give the supremum border : ');
  Readln(max);
  For i := 1 To nbl Do
    Begin
      For j := 1 To nbc Do
        Begin
          t[i,j] := min + Random((max-min)+1);
        End;
    End;
End;
// --------------------------------------------------------------------------
// - Finding the smallest element of a two demension table and its indices -
Procedure minind2D(Var T:TAB2D;NBL,NBC:tind);
Var
  i,j: Integer;
  minT,minindi,minindj: Integer;
Begin
  minindi := 1;
  minindj := 1;
  minT := T[1,1];
  For i:=1 To NBL Do
    Begin
      For j:=1 To NBC Do
        If T[i,j] < minT Then
          Begin
            minT := T[i,j];
            minindi := i;
            minindj := j;
          End;
    End;
  Writeln('T [',minindi,',',minindj,'] = ',T [minindi,minindj] );
End;
// --------------------------------------------------------------------------
// ------------------- tri par la methode de comptage -----------------------
Procedure tri_compt(T : tab1D ;tai:tind);
Var
  TT: tab1D;
  j : Integer;
  TC : tab1D;
Function comptinf(T:tab1D; tai:tind ;CN:Integer): Integer;
Var
  ct,i: Integer;
Begin
  ct := 0;
  For i := 1 To tai Do
    Begin
      If CN > T[i] Then
        ct := ct +1;
    End;
  comptinf := ct;
End;
Procedure const_TC(T : tab1D;tai:tind; Var TC : tab1D);
Var
  i : Integer;
Begin
  For i := 1 To tai Do
    Begin
      TC[i] := comptinf(t,tai,T[i] );
    End;
End;
Procedure corrige_TC(T : tab1D;tai : tind; Var TC : tab1D);
Var
  m,l : Integer;
Begin
  For m:= 1 To tai Do
    Begin
      For l:=1 To tai Do
        Begin
          If (TC[m] = TC[l]) And (m<>l) Then TC[l] := TC[l] + 1;
        End;
    End;
End;
Begin
  const_TC(t,tai,TC);
  Writeln;
  Writeln('');
  Writeln('voici la table de comptage avant correction');
  Writeln;
  write1d(tc,tai);
  corrige_TC(t,tai,TC);
  Writeln;
  Writeln('');
  Writeln('voici la table de comptage apres la correction ');
  Writeln;
  write1d(tc,tai);
  For j:=1 To tai Do
    Begin
      TT[TC[j]+1] := T[j] ;
    End;
  Writeln;
  Writeln('');
  Writeln('le nouveau tableau :');
  Writeln;
  write1d(TT,tai);
End;
// --------------------------------------------------------------------------
// ------------------ Tri par la methode d'insertion ------------------------
Procedure tri_insertion(Var T:tab1D; tai :tind);
Var
  i,j: Integer;
  stop: Boolean;
Begin
  For i:=2 To tai Do
    Begin
      j := i - 1;
      stop := False;
      While (j >= 1) And (Not(stop)) Do
        Begin
          If T[j+1] > T[j] Then
            stop := True
          Else
            Begin
              permut(T[j],T[j+1]);
              j := j-1;
            End;
        End;
    End;
  Writeln;
  Writeln('tableau trie par la methode d''insertion : ');
  Writeln('-------------------------------------------');
  Writeln;
  write1D(T,tai);
End;
// --------------------------------------------------------------------------
// ---------- THE smallest element in given colom of a 2D table -------------
Function mincolo(T:tab2D;TL:tind;j:Integer): Integer;
Var
  i,min: Integer;
Begin
  min := T[1,j];
  For i := 1 To TL Do
    Begin
      If min > T[i,j] Then
        min := T[i,j];
    End;
  mincolo := min;
End;
// --------------------------------------------------------------------------
// ----------- THE biggest element in a given line of a 2D table ------------
Function maxligne(T:tab2D;TC:tind;i:Integer): Integer;
Var
  j,max: Integer;
Begin
  max := T[i,1];
  For j := 1 To TC Do
    Begin
      If T[i,j] > max Then
        max := T[i,j];
    End;
  maxligne := max;
End;
// --------------------------------------------------------------------------
// ------------------------- point de selle ---------------------------------
Procedure pointdeselle(T:tab2D;TL,TC:tind;Var PS:Integer;Var savei,savej:Integer);
Var
  i,j: Integer;
  max,min: Integer;
Begin
  For i:=1 To TL Do
    Begin
      max := maxligne(T,TC,i);
      For j := 1 To TC Do
        Begin
          If T[i,j] = max Then
            Begin
              min := mincolo(T,TL,j);
              If min = max Then
                Begin
                  Writeln('we have found le point de selle T[',i,',',j,'] = ',T[i,j]);
                  savei := i;
                  savej := j;
                End;
            End;
        End;
    End;
End;
// --------------------------------------------------------------------------
// --------------------- transposee d'une patrice A -------------------------
Procedure transpo(T:tab2D;TL,TC:tind);
Var
  VC,VL: tind;
  V: tab2D;
  i,j: Integer;
Begin
  For i := 1 To TL Do
    Begin
      For j := 1 To TC Do
        Begin
          V[j,i] := T[i,j] ;
        End;
    End;
  VL := TC;
  VC := TL;
  write2D(V,VL,VC);
End;
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
Function freqlig(T:tab2D;TC,i:tind;d:Integer): Integer;
Var
  j,c: Integer;
Begin
  c := 0;
  For j := 1 To TC Do
    If d = T[i,j] Then
      c := c +1;
  freqlig := c;
End;
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
Function freqcol(T:tab2D;Tl,j:tind;d:Integer): Integer;
Var
  i,c: Integer;
Begin
  c := 0;
  For i := 1 To Tl Do
    If d = T[i,j] Then
      c := c +1;
  freqcol := c;
End;
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
Function freqrec(T:tab2D;a,b,c,d:Integer;N:Integer): Integer;
Var
  ct: Integer;
  i,j: Integer;
Begin
  ct := 0;
  For i:= a To b Do
    Begin
      For j := c To d Do
        Begin
          If T[i,j] = N Then
            ct := ct +1 ;
        End;
    End;
  freqrec := ct;
End;
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
Function region(T:tab2D ;i:Integer): Integer;
Var
  e: Integer;
Begin
  If i <= 3 Then e := 1
  Else If (i >= 4) And (i <= 6) Then e := 4
  Else If (i >= 7) And (i <=9) Then e := 7;
  region := e;
End;
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
Procedure ajouteligne(Var A:tab2D; Var TL,TC:tind; N:tind);
Var
  i,j,k: Integer;
Begin
  K := 0;
  i := TL;
  Repeat
    K := K+1;
    For j := 1 To TC Do
      Begin
        A[i+K,j] := A[k,j];
      End;
  Until k = N;
  TL := TL+N;
  Write2D(A,TL,TC);
End;
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
Procedure Romplcol(Var A:tab2D; TLA,NC:Integer; B:tab2D;TLB:Integer;NCB:tind);
Var
  i,j: Integer;
Begin
  j := NC;
  For i := 1 To TLA Do
    A[i,j] := B[i,NCB];
End;
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
Function determ3(A:tab2D;TL,TC:tind): Integer;
Var
  D1,D2,D: Integer;
Begin
  D1 := A[1,1]*A[2,2]*A[3,3]+A[2,1]*A[3,2]*A[4,3]+A[3,1]*A[4,2]*A[5,3];
  D2 := A[3,1]*A[2,2]*A[1,3]+A[4,1]*A[3,2]*A[2,3]+A[5,1]*A[4,2]*A[3,3];
  D := D1-D2;
  determ3 := D;
End;
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
Procedure Solve3eq(Var A:tab2D; Var TLA,TCA:tind; Var B:tab2D; Var TLB,TCB:tind);
Var
  V1,V2,V3: tab2D;
  N: tind;
  TCV1,TLV1,TCV2,TLV2,TCV3,TLV3: tind;
  x,y,z: Real;
  D,Dx,Dy,Dz: Real;
Begin
  read2D(A,TLA,TCA);
  V1 := A;
  V2 := A;
  V3 := A;
  TCV1 := TCA;
  TLV1 := TLA;
  TCV2 := TCA;
  TLV2 := TLA;
  TCV3 := TCA;
  TLV3 := TLA;
  Writeln;
  Writeln('la matrice A des coeffs : ');
  Writeln('------------------------');
  write2D(A,TLA,TCA);
  Writeln;
  Writeln;
  read2D(B,TLB,TCB);
  Writeln;
  Writeln('le vecteure B : ');
  Writeln('--------------');
  write2D(B,TLB,TCB);
  Writeln;
  ajouteligne(A,TLA,TCA,2);
  D := determ3(A,TLA,TCA);
  romplcol(V1,TLA,1,B,TLB,1);
  Writeln;
  ajouteligne(V1,TLV1,TCV1,2);
  Dx := determ3(V1,TLV1,TCV1);
  Writeln;
  romplcol(V2,TLA,2,B,TLB,1);
  ajouteligne(V2,TLV2,TCV2,2);
  Dy := determ3(V2,TLV2,TCV2);
  Writeln;
  romplcol(V3,TLA,3,B,TLB,1);
  ajouteligne(V3,TLV3,TCV3,2);
  Dz := determ3(V3,TLV3,TCV3);
  If D = 0 Then
    Writeln('MATRICE SINGULIERE')
  Else
    Begin
      x := Dx / D;
      y := Dy / D;
      z := Dz / D;
      Writeln;
      Writeln('------------------');
      Writeln('the solutions are : ');
      Writeln('------------------');
      Writeln(' x = ',x:2:2);
      Writeln(' y = ',y:2:2);
      Writeln(' z = ',z:2:2);
    End;
End;
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
Function matriceinverse2carr(T:tab2D; TL,TC:tind): tab;
// type reel
Var
  C,D: Real;
  i,j: Integer;
  inversible : Boolean;
  V: tab;
Begin
  If determ2(T,TL,TC) <> 0 Then
    Begin
      inversible := True;
      D := determ2(T,TL,TC);
    End
  Else
    inversible := False;
  If inversible Then
    Begin
      V[1,1] := T[2,2];
      V[1,2] := -T[1,2];
      V[2,1] := -T[2,1];
      V[2,2] := T[1,1];
      C := 1 / D;
      For i := 1 To TL Do
        Begin
          For j:= 1 To TC Do
            V[i,j] := C*V[i,j];
        End;
      matriceinverse2carr := V;
    End;
End;
//for displaying the table of real elements

{For i:= 1 To TL Do
    Begin
      For j:= 1 To TC Do
        Begin        IF (v[i,j] <= 0)then
                  Write(V[i,j]:2:2,' | ')
									else
									Write(V[i,j]:2:2,'  | ');
          If j = TC Then
            Writeln;
        End;
    End;  }
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
Function determ2(T:tab2D;TL,TC:tind): Real;
Var
  D: Real;
Begin
  D := T[1,1]*T[2,2]-T[2,1]*T[1,2];
  determ2 := D;
End;
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
Procedure produitmatricielle(A:tab2D;LA,CA:tind;B:tab2D;LB,CB:tind;Var P:tab2D;Var LP,CP:tind);
Var
  k,i,j: Integer;
  compt: Boolean;
  rep: Integer;
Begin
  If CA <> LB Then
    compt := False
  Else compt := True;
  If compt Then
    Begin
      rep := CA;
      LP := LA;
      CP := CB;
      For i := 1 To LA Do
        Begin
          For j :=1 To CB Do
            Begin
              For k := 1 To rep Do
                P[i,j] := P[i,j] + A[i,k]*B[k,j];
            End;
        End;
    End ;
End;
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
//	ateler 1
//***************************************************************************//
// part1
Procedure Findfibo(V:tab1D;tai:tind;Var T:tab1D; Var taiT:tind);
Var
  N,i,j,k,MV: Longint;
  F: tab1D;
  taiF: tind;
Begin
  i := 1;
  j := 0;
  MV := maxtab1D(V,tai);
  N := 0;
  While N < MV Do
    Begin
      j := j+1;
      i := i+1;
      N := fibonacci(i);
      F[j] := N;
    End;
  taiF := j;
  For i :=1 To tai Do
    Begin
      For j := 1 To taiF Do
        Begin
          If (V[i] = F[j]) Then
            Begin
              k := k+1;
              T[k] := V[i];
            End;
        End;
    End;
  taiT := K;
End;
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
Procedure D2(V:tab1D;tai:tind;Var V2:tab1D;Var taiV2:tind);
Var
  N,i,k: Longint;
  partC: Boolean;
Begin
  k := 0;
  For i := 1 To tai Do
    Begin
      N := V[i];
      partC := partcent(N);
      If partC Then
        Begin
          k := k+1;
          V2[k] := V[i];
        End;
    End;
  taiV2 := k;
End;
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
Procedure partieA(V:tab1D;tai:tind;Var T:tab2D;Var TL,TC:tind);
Var
  V1,V2: tab1D;
  taiV1,taiV2: tind;
  k,i,j, maxtaiV,Mtai,N: Longint;
  imposterV1,imposterV2: Boolean;
Begin
  k := 0;
  findfibo(V,tai,V1,taiV1);
  D2(V,tai,V2,taiV2);
  If taiV1 > taiV2 Then
    maxtaiV := taiV1
  Else
    maxtaiV := taiV2;
  Mtai := tai-taiV1+taiV2;
  If Mtai > maxtaiV Then
    maxtaiv := Mtai;
  For j:=1 To maxtaiv Do
    Begin
      T[1,j] := V1[j]
    End;
  For j:=1 To maxtaiv Do
    Begin
      T[2,j] := V2[j]
    End;
  For j:=1 To tai Do
    Begin
      imposterV1 := True;
      imposterV2 := True;
      N := V[j];
      For i :=1 To taiV1 Do
        Begin
          If (N = V1[i]) Then
            imposterV1 := False;
        End;
      For i:=1 To taiV2 Do
        Begin
          If (N = V2[i]) Then
            imposterV2 := False;
        End;
      If (imposterV1) And (imposterV2) Then
        Begin
          k := k+1;
          T[3,k] := V[j];
        End;
    End;
  TL := 3;
  TC := maxtaiV;
End;
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
//	ateler 2
//***************************************************************************//
Procedure compres(V:tab1D;tai:tind;Var C:tab1D;Var taic:tind);
Var
  k,i,d,ct: Integer;
Begin
  C[1] := V[1];
  d := V[1];
  k := 2;
  i := 1;
  ct := 1;
  Repeat
    If d = V[i+1] Then
      Begin
        ct := ct+1;
        C[k] := ct;
      End
    Else
      Begin
        k := k+1;
        ct := 1;
        C[k] := ct;
        d := v[i+1];
      End;
    i := i+1;
  Until i >= tai;
  taic := k;
End;
// --------------------------------------------------------------------------
// ------- Converting a two demenssion table to one demenssion table --------
Procedure convert2Dto1D(T:tab2D;TL,TC:tind;Var V:tab1D;Var tai:tind);
Var
  i,j: Integer;
  d: Integer;
Begin
  d := 0;
  For i := 1 To TL Do
    Begin
      For j := 1 To TC Do
        Begin
          d := d+ 1 ;
          V[d] := T[i,j];
        End;
    End;
  tai := d;
End;
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
Procedure decompres(C:tab1D;taic:tind;Var V:tab1D; Var tai:tind);
Var
  k,i,d,ct: Integer;
Begin
  V[1] := C[1];
  d := C[1];
  k := 1;
  i := 1;
  Repeat
    ct := C[i+1];
    While ct > 1 Do
      Begin
        k := k+1;
        V[k] := d;
        ct := ct-1;
      End;
    If ct = 1 Then
      Begin
        d := 1 - d;
        k := k+1;
        V[k] := d;
      End;
    i := i+1;
  Until i = taic;
  tai := k;
End;
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
Procedure convert1Dto2D(V:tab1D;tai:tind;Var A:tab2D;Var TL,TC:tind);
Var
  k,i,j: Integer;
Begin
  TL := 7;
  TC := 5;
  k := 1;
  For i:=1 To TL Do
    Begin
      For j:=1 To TC Do
        Begin
          A[i,j] := V[k];
          k := K+1;
        End;
    End;
End;

// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
End.