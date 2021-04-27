-- This program may not run

-- length :: [a] -> Int  (polymorphic function)
length [1,2,3,5]
-- reverse :: [a] -> [a]
reverse [12,3,1,45,0,9]
-- concat :: [[a]] -> [a]
concat [[1,2] , [90,76]]

-- map :: (a->b) -> ([a] -> [b])
map (+1) [2,3,4]

-- filter :: (a->Bool) -> ([a] -> [a])
filter (>6) [1,4,6]

-- lines :: String -> [String]
lines "a\nabc\nhd"

-- unlines :: [String] -> String
unlines ["a" , "abc" , "bc"]

-- tails :: [a] → [[a]] 
tails "ralf" = ["ralf", "alf", "lf", "f", ""]
-- take :: Int → [a] → [a] 
take 3 "hello, world" = "hel"
-- sort :: (Ord a) ⇒ [a] → [a] 
sort "hello, world" = " ,dehllloorw"
-- group :: (Eq a) ⇒ [a] → [[a]] 
group "hello" = ["h", "e", "ll", "o"]
