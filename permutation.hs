insert(a ,[]) = [[a]]
insert(a , as@(b:bs)) = (a:as) : [ b:cs | cs <- insert(a,bs)]