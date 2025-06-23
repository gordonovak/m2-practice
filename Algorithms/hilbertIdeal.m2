

-- First, we define our ring
R = QQ[x_1..x_2, y_1..y_2];

-- Then, we set up our two ideals
-- First ideal defines our group action
I_g = ideal(y_1 - x_2, y_2 - x_1);
-- The second ideal sets us up to elimate our y variables. 
I_y = ideal(y_1, y_2);

-- Then, we want to add our two ideals together
I = I_g + I_y;
-- Next, we're just going to yank the generators from I
L = flatten entries gens I


-- Now, we set up the new ring without the y-components
S = QQ[x_1..x_2]

-- Then, we want to define a map that bricks the y-components and sends them to 0
-- Here, S is the codomain and R is the domain. 
f = map(S, R, {x_1, x_2, 0 , 0})

-- Then, after setting up our map we divide out our generators by our map:
L / f