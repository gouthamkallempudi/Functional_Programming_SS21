-- same is running in ghci, but throwing error while calling this as a function


import System.IO.Unsafe
import Data.List

findpatterns filename = do
                         s <- readFile filename
                         map (take 1) (filter (\x -> length x > 1) (group(sort(lines s))))