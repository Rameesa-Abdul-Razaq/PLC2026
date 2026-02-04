ask :: String -> IO ()
ask prompt =
  do
  putStrLn prompt
  line <- getLine
  if line == ""
    then ask (prompt ++ "!") -- recursion here to loop again with modified prompt
    else if (line == "quit") then putStrLn("quitting") -- so this line is added for a loop
    else do
      putStrLn ("you said: " ++ reverse line)
      ask prompt -- them recursion here to loop again by calling the method
  -- cuurently does not loop and only asks once
  -- to loop, we can use recursion, by calling the method within itself
main :: IO ()
main =
  do
  let prompt = "please say something"
  ask prompt