

restart

needsPackage "InvariantRing";

R = QQ[w,x,y,z];
class R;

W = matrix{{0,1,-1,1},{1,0,-1,-1}};
class W;

T = diagonalAction(W, R)

RG = invariantRing(T);

generators RG