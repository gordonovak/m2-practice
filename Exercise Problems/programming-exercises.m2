-- Exercise 1
M = permutationMatrix toString 123

-- Exercise 2
powerFunc = (L, n) -> (
    for i in L list i^n
)

-- Exercise 3
addFunc = (L, n) -> (
    count = 0;
    prod = 1;
    for i in L do (
        count = count + i^n;
        prod = prod * i^n;
    );
    print ("Sum: " | toString count);
    print ("Product: " | toString prod);
)
h = {1,2,3}
n = 2

powerFunc(h,n)
addFunc(h,n)

-- Exercise 4
for i from 0 to 999 list (if (i%5!=0) then continue; i)

-- Exercise 5
n = 15;
R = QQ[x_0 .. x_n];
L = for i from 1 to 200 list (ideal(x_(random n), x_(random n)));
count = new MutableList from {0,0};
for i in L do (
    if (dim(i)==14) then (
        count#0 = count#0 +1;
    )
    else if (dim(i)==15) then (
        count#1 = count#1 +1;
    )
);
print ("Dim 14: " | toString count#0);
print ("Dim 15: " | toString count#1);
