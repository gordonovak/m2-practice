-- Exercise 1
viewHelp "%"

-- Exercise 2
R = QQ[x,y,z]
restart 
R

-- Exercise 3
R = QQ[x,y,z]
I = ideal(x,y)
-- f = xy
f = x*y
(oo % I) == 0



-- Exercise 4
if (((f % I) == 0) == true) then (
    s= " in the ideal";
	print("element is" | s)
	) else (
	print("element is not" | s);
	)

-- Exercise 5    
g = z+z^2
if (((g % I) == 0) == true) then (
    s= " in the ideal";
	print("element is" | s)
	) else (
	print("element is not" | s);
	)

-- Exercise 6? Many possible solutions!

-- Exercise 7
F = R^4
-- F_{4}
F_{3}

-- Exercise 8
M = matrix {{x^2,y^2,x*y,x*z}}
image M
kernel M
J = ideal (image M)
generators J
generators M
generators image M
generators kernel M
rank kernel M
presentation kernel M
cokernel M
N = kernel M ++ cokernel M
generators N
relations N
prune N
C = res image M
D = res J
