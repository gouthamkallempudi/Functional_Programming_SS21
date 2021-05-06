data Expr = Lit Integer | Expr :+: Expr | Expr :*: Expr
showExpr :: Expr -> String
showExpr(Lit i) = show i
showExpr(e1 :+: e2) = "(" ++ showExpr e1 ++ "+" ++ showExpr e2 ++ ")"
showExpr(e1 :*: e2) = "(" ++ showExpr e1 ++ "*" ++ showExpr e2 ++ ")"