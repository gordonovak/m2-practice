--  CREDITS  --
--  Advisor: Francesca Gandini
--  Code: Gordon Novak & Sumner Strom
--      * Last Editied 06/24/25


load "abeliangroupinvariants.m2";

R = QQ[x,y,z]
d = {numgens R, 3}
W= matrix{{1,0,1},{0,1,1}}
L = diagonalAction{W,d,R}
Z2ComprehensiveVectorGenerator(4,2)
AbelianGroupSkewInvariants(L,R,d)
