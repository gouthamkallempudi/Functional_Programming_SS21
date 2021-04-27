-- Where (declaration style) and let(expression style) keyword
demo :: Integer -> Integer -> Integer
demo x y = (a + 1) * (b + 2)
     where a = x-y
           b = x+y

demo_1 :: Integer -> Integer -> Integer
demo_1 x y = let a = x-y
                 b = x+y
             in (a+1)*(b+2)