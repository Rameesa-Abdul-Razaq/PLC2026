module Main where

import Text.Printf

-- start of code to focus on in Practical 4

data Person -- another record
    = Person
        {
          person_name :: String
        }
    deriving (Eq) -- automatically allows comparisons, so item1 == item2 can only work if this is here

instance Show Person where 
    -- using Java terminology: Person implements interface Show
    show (Person name) = name -- how to format a Person record

data Item -- data is a record type, and we are creating a new one called Item
    = Piece -- this is the one constructor 
        {
            -- what the record contains
            item_name :: String,
            item_performer :: Person,
            item_length_secs :: Float
        }
        | -- union of 2 records peice and pause
      Pause 
        {item_length_secs:: Float
        }
    deriving (Eq)

--defines how an item should be printed
instance (Show Item) where
    show (Piece name performer len) =
        printf "%s by %s (%.1fs)" name (show performer) len
        -- pattern matching to the constructor Piece, and then using the fields to format the string
        -- %s is the string matching
        --1fs is the float matching, and .1 means to round to 1 decimal place
    show (Pause len) =
        printf "Pause (%.1fs)" len
        -- show the pause1 as "Pause (5.0s)"

-- the construction of the records, using the constructor Piece and Pause, 
--and then filling in the fields with the appropriate values
piece1 =
    Piece
    { 
        item_name = "Prelude",
        item_performer = Person "Claudio Arrau",
        item_length_secs = 17*60+26
    }

piece2 =
    Piece
    { 
        item_name = "Moonlight Sonata",
        item_performer = Person "Daniel Barenboim",
        item_length_secs = 16*60+49
    }

pause1 =
    Pause
    { 
        item_length_secs = 5
    }

--(shorterPiece, longerPiece) = sortTwoItems (piece1, piece2) -- TASK 
-- combining both pieces into a tuple, 
--and then using the function sortTwoItems to sort them by length,
-- and then unpacking the sorted tuple into shorterPiece and longerPiece

sortTwoItems (item1, item2) = 
    if item_length_secs item1 <= item_length_secs item2
        then (item1, item2)
        else (item2, item1)

main =
    do
        let (shorterPiece, longerPiece) = sortTwoItems (piece1, piece2)
        -- just showing the terminal for the user
        putStrLn "piece1 and piece2 sorted by length:" 
        putStrLn $ show shorterPiece
        putStrLn $ show longerPiece
        putStr "piece1 = "
        putStrLn $ show piece1
        putStr "pause1 = "
        putStrLn $ show pause1





