-- This is a comment line
-- The first line is to specify the type of the function
square :: Int -> Int
square x = x * x

-- Second function taking two arguments
smaller :: (Int, Int) -> Int
smaller (x,y) = if x>y then x else y
