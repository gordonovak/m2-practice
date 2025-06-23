AbelianGroupSkewInvariants = (W,R) -> (
    -- W is a finite abelian group
    -- R is a ring
    -- Returns the invariants of W over R
    
    -- Check if W is a finite abelian group
    if not isFiniteAbelianGroup(W) then (
        error "W must be a finite abelian group"
    );
    
    -- Compute the invariants
    invariants = {};
    for j from 1 to 2^(numgens R) do (
        k = vector j; -- make a vector base 2 of j with numgens R entries for all of the powers there can be in the skew setting
        for i from 1 to rank(W) do (
            v = vector row i W; -- get the i-th row of the group
            if (v * k)%rank(W) == 0 then (
                invariants = append(invariants, k);
            );
        );
    )
    
    
    return invariants;
);