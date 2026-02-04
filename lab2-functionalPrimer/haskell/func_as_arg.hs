--create inpFunc
inpFunc a b = [a..b] 
--Define applicatorFunc
applicatorFunc inpFunc a b s = if s=='s' then sum (inpFunc a b) else (sum (inpFunc a b))/(b-a+1)               
main = do
  let result = applicatorFunc inpFunc 1 10 's' --Call applicatorFunc with inpFunc, integers and char as args
  putStrLn("sum = " ++ show result)
  --let result2 = applicatorFunc inpFunc 1 10 'a' --Call applicatorFunc with inpFunc, integers and char as args
  --putStrLn("average = " ++ show result2)

--func_as_arg.hs rewritten using guards
--create inpFunc
{-inpFunc a b = [a..b] 
applicatorFunc inpFunc a b s | s=='s'  = sum (inpFunc a b) 
               | otherwise = (sum (inpFunc a b))/(b-a+1)              
main = do
  let result = applicatorFunc inpFunc 1 5 's' --Call applicatorFunc with inpFunc, integers and char as args
  putStrLn("sum = " ++ show result)
-}