Unit BIB01;
Interface
Uses Wincrt,crt;

//************************** functions **************************************//
Function fact(N:Integer): Integer;
Function Pos(N:Integer): Integer;
Function sumd(N:Integer): Integer;
Function B1toB10(N,base1:Integer): Integer;
Function base1tobase2(N:Integer; base1,base2:Integer): Integer;
Function fibonacci(N:Integer): Integer;
Function parfait(N:Integer): Boolean;
Function binadd(N1,N2:Integer): Integer;
Function swapp(N:Integer): Integer;
Function power(N:Integer;p:Integer): Integer;
Function decal(N,ND:Integer): Integer;
//Function Concat(A,B:Integer): Integer;
Function freq(N,d:Integer): Integer;
Function firstd(N,d:Integer): Integer;
Function Nextgrey(N:Integer): Integer;
Function bigd(N:Integer): Integer;
Function smalld(N:Integer): Integer;
Function posd(N:Integer;dc:Integer): Integer;
Function swapping_digits(N,d,cd:Integer): Integer;
Function orderC_of_N(N:Integer): Integer;
Function orderDC_of_N(N:Integer): Integer;
Procedure permut(Var A,B:Longint);
Function find_base(A,B:Integer): Integer;
function prod(N:integer):integer;
Function Extr_G (N, P:Longint): Longint;
Function Extr_D (N, P:Longint): Longint;
Function extr_Nb(N,L,P:Longint) : Longint;
Function PartCent(N:Longint): Boolean;
Function premier(a:Integer): Boolean;
//Procedure miroir_mult;
//***************************************************************************//



Implementation
//------------------------------- factorielle -------------------------------

Function fact(N:Integer): Integer;
Var
  i,f: Integer;
Begin
  f := 1 ;
  For i := 1 To N Do
    Begin
      f := f*i;
    End;
  fact := f;
End;
// --------------------------------------------------------------------------
//------------------------------  position  ---------------------------------

Function Pos(N:Integer): Integer;
Var
  p: Integer;
Begin
  p := 0;
  Repeat
    p := 1+p;
    N := N Div 10;
  Until N = 0;
  Pos := p;
End;
// --------------------------------------------------------------------------
//---------------------- Sum of factors -------------------------------------

Function sumd(N:Integer): Integer;
Var
  i,sf: Integer;
Begin
  sf := 0;
  For i:= 1 To N Div 2 Do
    Begin
      If n Mod i = 0 Then
        sf := sf+i;
    End;
  sumd := sf;
End;
// --------------------------------------------------------------------------
// ----------------------- Converting from any base to decimal --------------
Function B1toB10(N,base1:Integer): Integer;
Var
  N2,d,k: Integer;
Begin
  K := 1;
  N2 := 0;
  Repeat
    d := N Mod 10;
    N2 := d *k + N2;
    k := base1 * K;
    N := N Div 10;
  Until N = 0;
  B1toB10 := N2;
End;
// --------------------------------------------------------------------------
// -------------------- converting from base 1 to base 2 --------------------

Function base1tobase2(N:Integer; base1,base2:Integer): Integer;
Var
  N1,N2,t,d,k: Integer;
Begin
  N1 := B1toB10(N,base1);
  t := 1;
  N2 := 0;
  Repeat
    d := N1 Mod base2;
    N2 := N2+d*t;
    t := 10*t;
    N1 := N1 Div base2;
  Until N1=0;
  base1tobase2 := N2;
End;
// --------------------------------------------------------------------------
// ------------- calcue le Nieme terme de la suite de fibonacci -------------
Function fibonacci(N:Integer): Integer;
Var
  i,Un,U0,U1: Integer;
Begin
if N = 0 then 
   fibonacci := 0
	 else if N = 1 then 
  fibonacci := 1
	else
	begin 
	U0:=0;
	U1:=1;
  For i:=2 To n Do
    Begin
      Un := U1+U0;
      U0 := U1;
      U1 := Un;
    End;
  fibonacci := Un;
	end;
End;
// --------------------------------------------------------------------------
// ------------------------ perfect numbers ---------------------------------
Function parfait(N:Integer): Boolean;
Begin
  If N = sumd(N) Then
    parfait := True
  Else parfait := False ;
End;
// --------------------------------------------------------------------------
// -------------------------- Binary addition -------------------------------
Function binadd(N1,N2:Integer): Integer;
Var
  sum: Integer;
Begin
  N1 := B1toB10(N1,2);
  N2 := B1toB10(N2,2);
  Sum := base1tobase2(N1+N2,10,2);
  binadd := sum;
End;
// --------------------------------------------------------------------------
// --------------------------- SWAPPING LSB AND MSB -------------------------
Function swapp(N:Integer): Integer;
Var
  mb,lb,SN,D,x: Integer;
Begin
  If N Div 10 = 0 Then
    Begin
      Swapp := SN;
    End
  Else
    Begin
      D := N;
      lb := N Mod 10;
      x := 1;
      Repeat
        mb := N Mod 10;
        x := x*10;
        N := N Div 10;
      Until N = 0;
      D := D - lb + mb ;
      SN := (D Mod (x Div 10)) +(x Div 10)*lb;
      Swapp := SN;
    End
End;
// --------------------------------------------------------------------------
// ------------------------- the power of a number --------------------------
Function power(N:Integer;p:Integer): Integer;
Var
  NP: Integer;
Begin
  NP := 1;
  If p = 0 Then
    power := 1
  Else
    Begin
      Repeat
        NP := N*NP;
        p := P-1;
      Until p=0;
      power := NP;
    End;
End;
// --------------------------------------------------------------------------
// ---------------------- decalages d'un nombre -----------------------------
Function decal(N,ND:Integer): Integer;
Var
  p,savep: Integer;
Begin
  p := Pos(N);
  p := power(10,p);
  savep := p;
  Repeat
    p := p Div 10;
    nd := nd-1;
  Until ND = 0;
  decal := ((N Mod p)*(savep Div p)+ N Div p);
End;
// --------------------------------------------------------------------------
// ------------------------ Concatinating two numbers -----------------------
Function Concat(A,B:Integer): Integer;
Var
  p,C: Integer;
Begin
  p := power(10,Pos(B));
  C := A*p+B;
  Concat := C;
End;
// --------------------------------------------------------------------------
Function freq(N,d:Integer): Integer;
Var
  sd,nd: Integer;
Begin
  sd := 0;
  Repeat
    nd := N Mod 10;
    If nd = d Then
      Begin
        sd := sd +1;
      End;
    N := N Div 10;
  Until N = 0;
  freq := sd;
End;
// --------------------------------------------------------------------------
// --------- the first accurence of a digit in a given number ---------------
Function firstd(N,d:Integer): Integer;
Var
  nd,dp: Integer;
Begin
  dp := 0;
  Repeat
    nd := N Mod 10;
    N := N Div 10;
    dp := dp+1;
  Until (nd=d) Or (N=0) ;
  firstd := dp;
End;
// --------------------------------------------------------------------------
// ------------ The codegrey of the next Number N in code grey --------------
Function Nextgrey(N:Integer): Integer;
Var
  Ngrey,p: Integer;
Begin
  If freq(N,1) Mod 2 = 0 Then
    Begin
      If N Mod 10 = 1 Then
        Ngrey := N - 1
      Else
        Ngrey := N + 1;
    End
  Else
    Begin
      p := power(10,firstd(N,1));
      If (N Div p ) Mod 10 = 0 Then
        Ngrey := N + p
      Else
        Ngrey := N - p;
    End;
  Nextgrey := Ngrey
End;
// --------------------------------------------------------------------------
// ----------------------- Permutation entre deux nombres -------------------
Procedure permut(Var A,B:Longint);
Var
  x : Longint ;
Begin
  x := A;
  A := B;
  B := x;
End;
// --------------------------------------------------------------------------
// -------------------- The biggest digit in a number N ---------------------
Function bigd(N:Integer): Integer;
Var
  d,bd: Integer;
Begin
  N := Abs(N);
  bd := N Mod 10 ;
  Repeat
    d := N Mod 10;
    If d > bd Then
      bd := d;
    N := N Div 10;
  Until N = 0;
  bigd := bd;
End;
// --------------------------------------------------------------------------
// -------------------- The smallest digit in a number N --------------------
Function smalld(N:Integer): Integer;
Var
  d,sd: Integer;
Begin
  N := Abs(N);
  sd := N Mod 10 ;
  Repeat
    d := N Mod 10;
    If d < sd Then
      sd := d;
    N := N Div 10;
  Until N = 0;
  smalld := sd;
End;
// --------------------------------------------------------------------------
// -------------- The position of a digit in a given number N ---------------
Function posd(N:Integer;dc:Integer): Integer;
Var
  d,p: Integer;
Begin
  p := 0;
  Repeat
    d := N Mod 10;
    N := N Div 10;
    p := p + 1;
  Until (N = 0) Or (d = dc) ;
  If (dc <> d) And (N = 0) Then
    p := 0;
  posd := p;
End;
// --------------------------------------------------------------------------
// --------------------- swapping digits ------------------------------------
Function swapping_digits(N,d,cd:Integer): Integer;
Var
  SN,P1,P2: Integer;
Begin
  P1 := power(10,posd(N,d)-1);
  P2 := power(10,posd(N,cd)-1);
  SN := N - d*P1 + cd*P1 - cd*P2 + d*P2;
  swapping_digits := SN;
End;
// --------------------------------------------------------------------------
// ---------- Reordering the digits of N in an increasing way ---------------
Function orderC_of_N(N:Integer): Integer;
Var
  k,d,bd,NB: Integer;
Begin
  NB := 0;
  k := 1;
  Repeat
    d := N Mod 10;
    bd := bigd(N);
    N := (swapping_digits(N,d,bd));
    NB := (N Mod 10)*k + NB;
    N := N Div 10;
    k := k*10;
  Until N = 0;
  orderC_of_N := NB;
End;
// --------------------------------------------------------------------------
// ------------ Reordering the digits of N in an decreasing way -------------
Function orderDC_of_N(N:Integer): Integer;
Var
  k,d,sd,NB: Integer;
Begin
  NB := 0;
  k := 1;
  Repeat
    d := N Mod 10;
    sd := smalld(N);
    N := (swapping_digits(N,d,sd));
    NB := (N Mod 10)*k + NB;
    N := N Div 10;
    k := k*10;
  Until N = 0;
  orderDC_of_N := NB;
End;
// --------------------------------------------------------------------------
// ---------- Finding the base of a A from its value in decimal -------------
Function find_base(A,B:Integer): Integer;
Var
  saveB,C,d: Longint;
  i,basex: Integer;
  findbase: Boolean;
  t: Longint;
Begin
  If A = B Then
    find_base := 10
  Else
    Begin
      saveB := B;
      i := 2;
      findbase := False;
      Repeat
        t := 1;
        C := 0;
        B := saveB;
        Repeat
          d := B Mod i;
          C := C + d*t;
          t := 10*t;
          B := B Div i;
        Until B = 0;
        If C = A Then
          Begin
            findbase := True;
            a := 1;
            basex := i;
          End
        Else
          If A > C Then
            Begin
              findbase := True;
              a := 0;
            End;
        B := saveB;
        i := i+1;
      Until findbase ;
      If a = 1 Then
        Begin
          find_base := basex;
        End
      Else
        If a = 0 Then
          Begin
            find_base := 0;
          End;
    End;
End;
// --------------------------------------------------------------------------
// -------------------- les multiplications miroires ------------------------
//Procedure miroir_mult;
//Var
//  N,z,savez,c,d: Integer;
//  ABC,DE: Integer;
//  mirror : Boolean;
//Begin
//  c := 0;
//  mirror := False ;
//  For ABC:= 123 To 987 Do
//    Begin
//      For DE := 12 To 98 Do
//        Begin
//          If DE*ABC = swapp(ABC)*swapp(DE) Then
//            Begin
//              Z := Concat(ABC,DE);
//              saveZ := Z ;
//              Repeat
//                d := Z Mod 10;
//                If (freq(saveZ,d) = 1) and (d <> 0) Then
//                  mirror := true
//                Else
//                  mirror := false;
//                Z := Z Div 10;
//              Until Z = 0 ;
//              If mirror Then
//                Writeln(ABC,' * ',DE,' = ',swapp(ABC),' * ',swapp(DE),' = ',ABC*DE);
//              c := c + 1 ;
//            End;
//        End;
//    End;
//End;
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
function prod(N:integer):integer;
var p,d,x:integer;
begin
p :=1;
repeat
d := N mod 10;
p := p*d;
N := N div 10;
until N =0;
prod:=p;
end;
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
Function Extr_G (N, P:Longint): Longint;
// ------------------------------------------
// Extrait P positions a gauche de N
// ------------------------------------------
Var NP1:integer;
Begin
  NP1:=Pos(N)-P;
  extr_G := N Div power(10, NP1);
End; //Extr_G
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
Function extr_Nb(N,L,P:Longint) : Longint;
//------------------------------------------------------------------
// extrait de N un nombre de l chiffres a partir de la position P (incluse)
// les positions sont numerotees de  gauche a droite
//   si p est nul, negatif ou depassant la taille de N alors resultat=0
//   si l negatif resultat=0
//   si si l depasse la taille de N alors troncature a droite
//------------------------------------------------------------------
Var
  a: Longint;
Begin
  If (P <= 0)Or (L<0) Or (P > Pos(N)) Then EXTR_NB := 0
  Else
    Begin
      a := extr_G(N,P+L-1);
      extr_nb := extr_D(a,P);
    End;
End;// extr_Nb
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
Function Extr_D (N, P:Longint): Longint;
// ------------------------------------------
// Extrait P positions a droite de N
// ------------------------------------------
Var NP1:Integer;
Begin
  NP1:=Pos(N)-P+1;
  extr_D := N Mod power(10,NP1);
End; //Extr_D
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
Function PartCent(N:Longint): Boolean;
// donne vrai si la partie centrale de N est composee du meme chiffre
Var
  nbext: Longint;
	NP1:Integer;

Begin //ParCent
  PartCent := False;
  If ((Pos(N) Mod 2 = 0) And (Pos(N)>2)) Then
    Begin
			NP1:= Pos(N)Div 2;
      nbext := extr_Nb(N,2,NP1);
      If ((nbext = 0) Or (nbext Mod 11 =0)) Then PartCent := True
    End
  Else
    If Pos(N)>3 Then
      Begin
			  NP1:=Pos(N)Div 2;
        nbext := extr_Nb(N,3,NP1);
        If (nbext = 0) Or (nbext Mod 111 =0) Then PartCent := True;
      End;
End; //ParCent
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
// CF 
//***************************************************************************
//***************************************************************************
Function premier(a:Integer): Boolean;
Var
  i :Integer;
  pr: Boolean;
Begin
pr:=true;
 for i := 2 to a div 2 do
 begin
 if (a mod i = 0 ) then
 pr := false;
 end;
 premier:=pr;
End;
// --------------------------------------------------------------------------
// --------------------------------------------------------------------------
End.