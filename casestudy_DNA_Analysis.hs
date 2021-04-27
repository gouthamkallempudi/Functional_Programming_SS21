-- In particular, you are interested in finding repeated segments of length 𝑚 in a DNA sequence of length 𝑛.
import Data.List

fun :: (String, Int) -> [[String]]
fun (dna,n) = filter (\x -> length x > 1) (group(sort(map (take n) (tails dna)))) 