-- Defining the Expression pattern
data Expr = Lit Integer | Expr :+: Expr | Expr :*: Expr deriving(Show)

-- Show expression takes expression and converts to string notation
showExpr :: Expr -> String
showExpr(Lit i) = show i 
showExpr(e1 :+: e2) = "(" ++ showExpr e1 ++ "+" ++ showExpr e2 ++ ")"
showExpr(e1 :*: e2) = "(" ++ showExpr e1 ++ "*" ++ showExpr e2 ++ ")"


-- parenthesis for below function
parenthesis :: Bool -> String -> String
parenthesis True s = "(" ++ s ++ ")"
parenthesis False s = s

-- For the above expression lets implement the brackets based on precedence 
showPrec :: Int -> Expr -> String
showPrec _ (Lit i) = show i
showPrec p (e1 :+: e2) = parenthesis(p>6)(showPrec 6 e1 ++ "+" ++ showPrec 6 e2)
showPrec p (e1 :*: e2) = parenthesis(p>7)(showPrec 7 e1 ++ "*" ++ showPrec 7 e2)


-- Instructions to stack machine
data Code = Push Integer | Add | Mul | Code :^: Code deriving(Show)

-- ShowCode maps a piece of stack information to String
showCode :: Code -> String
showCode(Push i) = "push " ++ show i  
showCode(Add) = "add"
showCode(Mul) = "mul"
showCode(c1 :^: c2) = showCode c1 ++ " ; " ++ showCode c2 


-- compilation
compile :: Expr -> Code
compile(Lit i) = Push i
compile(e1 :+: e2) = compile e1 :^: compile e2 :^: Add
compile(e1 :*: e2) = compile e1 :^: compile e2 :^: Mul

-- execution
type Stack = [Integer]

-- helper functions
push :: Integer -> (Stack-> Stack)
push i xs = i:xs

add :: Stack -> Stack
add[] = error msg
add[_] = error msg
add(x1 : x2 : xs) = x2 + x1 : xs


-- Commands to run
--  expr1 = (Lit 4 :*: Lit 7) :+: (Lit 11)
--  compile expr1
--  execute it []    it refers to previous result and [] is empty stack



mul :: Stack -> Stack
mul[] = error msg
mul[_] = error msg
mul(x1 : x2 : xs) = x2 * x1 : xs

msg :: String
msg = "VM : empty stack"

 
execute:: Code -> (Stack -> Stack)
execute(Push i) xs = push i xs
execute(Add) xs = add xs
execute(Mul) xs = mul xs
execute(c1 :^: c2) xs =  (execute c2 (execute c1 xs)) 
