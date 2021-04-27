-- using if else statement (expression style)
smaller :: (Int, Int) -> Int
smaller (x,y) = if x<y then x else y

-- using pattern matching
day :: Int -> String
day 1 = "Saturday"
day 2 = "Sunday"
day _ = "Weekday"

-- using guarded ( declaration style)
larger :: (Int, Int) -> Int
larger (x,y) 
    | x >= y = x
    | otherwise = y