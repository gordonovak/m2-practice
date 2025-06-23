--  CREDITS  --
--  Advisor: Francesca Gandini
--  Theory: Sumner Strom & Marcus Cassel
--  Psuedocode: Sumner Strom
--      * Last Editied 06/23/24
--  Code: Gordon Novak
--      * Last Editied 06/23/24

-- //////////////// --
-- //////////////// --
-- CODE STARTS HERE
-- //////////////// --
-- //////////////// --

--  We require the invariantRing package for serveral functions
needsPackage "InvariantRing"





Interations = (n, m) -> (
    apply(subsets(toList(0..n-1), m), S -> (
        v = for i to n-1 list 0;
        scan(S, i -> v#i = 1);
        v
    ))
)



--  METHOD_NAME: AbelianGroupSkewInvariants
--      INPUT: (W, R)
--          * W is a finite abelian group
--          * R is a ring
--      OUTPUT: List
--          * List of the invariants of W over R
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

    -- Now we make a list of the vectors we want to track
    a_vectors := {};
    -- Loop through the entire weight matrix


    -- Heyo

    for i from 0 to numColumns M - 1 do (
        -- Sum the entries and check if they're less than m
        if sum entries W_{:, i} <= m then (
            -- Then we iterate through our weight matrix again

            addit := true;
            for k from 0 to numRows M - 1 do (
                if not (W_{k,:} * W_{:, i} % p == 0) do {
                    addit := false;
                }
            );

            if addit do {
                a_vectors = a_vectors | W_{:, i};
            }
        );
    );

    grobussy := groebnerBasis(a_vectors);

    return grobussy;
);