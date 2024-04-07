program tarek;
uses wincrt,BIB02;
var T:tab1D;
tai:tind;
Begin
aleat1D(T,tai);
write1D(T,tai);
writeln;
writeln;
tri_bulles(T,tai);
end.