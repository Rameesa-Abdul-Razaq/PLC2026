-- the onePlusone function should print "1+1=2" to the screen


onePlusone = putStrLn("1+1=2")
main = do
    putStrLn "Welcome to the programme. Please enter your name"
    name <- getLine
    putStrLn("Hello " ++ name ++ ", hope you like Haskell.")
    onePlusone
    --the do block must be completed, putStrLn and getLine are IO actions