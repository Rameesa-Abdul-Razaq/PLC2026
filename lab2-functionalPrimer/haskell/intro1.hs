module Intro1 where --names the module, and can be imported into other Haskell programs

-- define named constants:
r1 = 1
r2 = b^2 + 1/b where b = 2 --where b is locally defined

-- define a function:
diff a b = abs (a - b) --takes 2 numbers, subtracts them and returns the absolute value

r3 = diff (diff a a) a  where a = 1
--to explain r3: where a = 1, diff a a = diff 1 1 which quals to 0, and then diff(0) 1 = 1
r4 = diff (diff a b) b  where a = 1; b = 1
--to explain this one both a and b are 1 and so diff a b = 0, and diff(0) 1 = 1

-- lists by enumeration
r5 = [1,3,4,1]
r6 = [1..5]

--this is a function called inc which added 1 to an number
inc n = n + 1

--map applies a function to every item in the list
r7 = map inc [1..3] -- so inc will be appled to 1,2,3 resulting in [2,3,4]
r8 = map (diff 2) [1..3] -- so diff 2 will be appled to 1,2,3 resulting in [1,0,1]
r9 = map sqrt [1..3] -- so sqrt will be appled to 1,2,3 resulting in [1.0,1.4142135623730951,1.7320508075688772]

-- zip combines two lists into a pair
r10 = zip [1..3] (map sqrt [1..3]) -- so merging the list [1,2,3] with the list of square roots of [1,2,3]
r11 = zip [1..3] (map sqrt [1..2]) -- so merging the list [1,2,3] with the list of square roots of [1,2] results in [(1,1.0),(2,1.4142135623730951)]

r12 = print [1..3]-- prints the output to the screen

main :: IO () -- main function is requires for running programs, and IO () means input/output with no return value
main = pure () -- does nothing