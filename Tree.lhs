Binary trees.

> data Tree elem = Leaf | Node (Tree elem) elem (Tree elem)
>   deriving (Show)
>
> single :: elem -> Tree elem
> single a = Node Leaf a Leaf

> size :: Tree some -> Int
> size Leaf          = 0
> size (Node l _a r) = size l + 1 + size r

< height :: Tree some -> Int

< full, leftLeaning, rightLeaning :: Int -> Tree ()

< full :: Int -> Tree ()
< full h = if h == 0 then Leaf else Node t () t
<   where t = full (h - 1)

> leftLeaning :: Int -> Tree ()
> leftLeaning h = if h == 0 then Leaf else Node (leftLeaning (h - 1)) () Leaf

> full :: Tree ()
> full = Node full () full
>
> prune :: Int -> Tree elem -> Tree elem
> prune _h Leaf = Leaf
> prune h (Node l a r) = if h == 0 then Leaf else Node (prune (h - 1) l) a (prune (h - 1) r)

> nats :: Integer -> Tree Integer
> nats n = Node (nats (2 * n + 1)) n (nats (2 * n + 2)) 

Lazy evaluation at work!

> inorder :: Tree elem -> [elem]
> inorder Leaf         = []
> inorder (Node l a r) = inorder l ++ [a] ++ inorder r

O(n^2) - bad, unexpected.

> inorderCat :: Tree elem -> [elem] -> [elem]
> inorderCat Leaf         xs = xs
> inorderCat (Node l a r) xs = inorderCat l (a : inorderCat r xs)

O(n) - good cannot be better than that.

Specifikation: inorderCat tree list = inorder tree ++ list

Binary search trees.

< member :: (Ord elem) => elem -> Tree elem -> Bool

< insert :: (Ord elem) => elem -> Tree elem -> Tree elem


 f Leaf         = ?
 f (Node l a r) = f l ? f r
