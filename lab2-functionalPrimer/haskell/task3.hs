--this function returns -1 for negative numbers, 0 for zero, and 1 for positive numbers
sgn x = if x < 0 
          then -1 
          else if x == 0 
              then 0 
              else 1
--alternative implementation using guards
-- this is the guard function version 
sgnGuards x | x < 0 = -1
            | x == 0 = 0
            | otherwise = 1

main = do
    putStrLn "Please enter a number"
    input <- getLine 
    let x = (read input :: Int)
    putStrLn( show (sgn (x)) )
