--  CREDITS  --
--  Advisor: Francesca Gandini
--  Theory: Sumner Strom & Marcus Cassel
--  Psuedocode: Sumner Strom
--      * Last Editied 06/23/24
--  Code: Gordon Novak
--      * Last Editied 06/24/24

-- //////////////// --
-- //////////////// --
-- CODE STARTS HERE
-- //////////////// --
-- //////////////// --

--  We require the invariantRing package for serveral functions
needsPackage "InvariantRing"


-- METHOD_NAME: Z2VectorGenerator
-- USAGE: Generates a list with all Z2 vectors of length n with m entries. 
--      INPUT: 
--          * n : length of vector
--          * m : number of entries
--      OUTPUT:
--          * vecList : all vectors of length n with m entries.
Z2VectorGenerator = (n, m) -> (
    -- Make a list to store all the vectors
    vecList := {};
    -- Then, we use the apply function to start placing our 1s
    apply(
        -- We make a set of all subsets of possible index positions for our 1 entries in every vector of size m (stored in "S")
        subsets(toList(0..n-1), m), 
        -- Then, we create a function to update a vector "v" with all the correct entries
        S -> (
            -- Creates a new mutable v (so we can change it)
            v := new MutableList;
            -- Updates every entry in v to 0
            for i from 0 to n-1 do (
                v = append(v, 0);
            );
            -- Goes through one of the nested lists of S and updates the proper indecies of v with 1. 
            scan(S, i -> v#i = 1);
            -- Appends v to the original vecList (we need to turn v into a regular list first though)
            vecList = vecList | {toList v};
        )
    );
    -- Finally returns the output. 
    return vecList;
);


-- METHOD_NAME: Z2ComprehensiveVectorGenerator
-- USAGE: Generates a list with all Z2 vectors of length n with m or fewer entries. 
--      INPUT: 
--          * n : length of vector
--          * m : number of entries
--      OUTPUT:
--          * vecList : all vectors of length n with m or fewer entries.
Z2ComprehensiveVectorGenerator = (n, m) -> (
    -- First, we make a list to store everything in.
    allVec := {};
    -- Then, we go through every number of entries that we want (from 0 to m)
    for i from 0 to m do (
        -- Then, we just append the Z2VectorGenerator function to the allVec function 
        allVec = allVec | Z2VectorGenerator(n, i);
    );
    -- Return the output.. 
    return allVec;
)


--  METHOD_NAME: AbelianGroupSkewInvariants
--      INPUT: (W, R)
--          * W is a finite abelian group
--          * R is a ring
--      OUTPUT: List
--          * List of the invariants of W over R


R = QQ[x..z];
numgens R
m = 3
a_vectors = Z2ComprehensiveVectorGenerator(numgens R, m)

zeroVec = for i to 4 list 0

AbelianGroupSkewInvariants = (W,R,p) -> (

    -- Check if W is a finite abelian group
    if not isAbelian W then (
        print "ERR: Group must be abelian.";
        return {};
    )
    if not isFinite W then (
        print "ERR: Group must be finite.";
        return {};
    )
    
    -- First, we make an empty list of the invariants
    invariants = {};

    -- Then, we establish the maximum number of tests we need to do for every polynomial. We set this value to m.
    m := min(order W, numgens R);

    -- Now we make a list of the Z2 vectors
    numgens R
    a_vectors = Z2ComprehensiveVectorGenerator(numgens R, m)
    -- Loop through the entire weight matrix

    -- Create a zero vector to compare our results to.
    zeroVec = for i to (numColumns W)-1 list 0;
    -- Create a list of all the generators of r
    varList = gens R;
    -- Then we run through all the a_vectors
    for x in a_vectors do (
        -- Then, we check if the multiplication results in the zeroVector. If it is, then we know that the representative polynomial is invarinat. 
        if (W * x == zeroVec) then (
            -- First, we create a placeholder variable. Current our invariants are in the form {0, 1, 1, ...} and that won't do.
            -- Our placeholder will start off as 1 so we can multiply anything to it. 
            invar = 1;
            -- Then, we want to get the entryWise product of our a_vector list with our varList. 
            -- This will turn {0, 1, 1, ...} * {x, y, z, ...} into {0, y, z, ...}.
            -- Then, we multiply every element in the new list, {0, y, z, ...}, to our invar variable.
            -- This will update invar to be something like yz..., our invariant polynomial, which we can then add to the invariants list. 
            for k in (for i to n list a_vectors#i * varList#i) do (invar = invar * k);
            -- Then we add it to the invariant list. 
            invariants = invariants | {invar};
        );
    );

    -- Grobussy
    grobussy := groebnerBasis(invariants);

    return grobussy;
);