module Main where

import Text.Printf -- allows formatting printing

-- recordtype Product is created
data Product
    = Product
        {
          product_name :: String
        , product_brand :: String
        }
    deriving (Eq)

-- defines how the Product type is printed
instance Show Product where 
    show (Product name brand) = 
        printf "%s by %s" name brand

-- another record type Item is created, which can be either a Piece or an Advert
-- in both item_length_secs appears, and haskell 
-- haskell allows us to reuse the same name for both constructors, as they are in different namespaces
data Item
    = Piece
        {
            item_name :: String,
            item_performer :: String,
            item_length_secs :: Float
        }
    | Advert
        {
            item_product :: Product,
            item_length_secs :: Float
        }
    deriving (Eq)

-- isAdvert checks if the item is an advert
-- returns True if it is, False otherwise
isAdvert (Advert _ _) = True
isAdvert _ = False

--validation checking if the item is valid, 
--by checking the length of the piece or advert
itemOK (Piece _ _ len) = 0 < len && len < 36000
itemOK (Advert _ len) = 0 < len && len < 120

-- defines printing for both constrctors of Item
instance (Show Item) where
    show (Piece name performer len) =
        printf "%s by %s (%.1fs)" name performer len
    show (Advert product len) =
        printf "Advert for %s (%.1fs)" (show product) len

-- creating the peices, advert and playlists
piece1 = Piece "Moonlight" "C. Arrau" (17*60+26)
piece2 = Piece "Pathetique" "D. Barenboim" (16*60+49)
advert1 = Advert (Product "Bounty" "Mars") 15

playlist1 = [piece1, advert1, piece2] -- list of items, can be pieces or adverts

lengths1 = [ item_length_secs item | item <- playlist1 ] --mapping

playlist1noAds = [ item | item <- playlist1, not (isAdvert item) ] -- filtering

playlist2 = [piece2, advert1]

playlists = [playlist1, playlist2] -- a list of lists

--tasks 6.3-b
-- this is a lis 2 comprehension that goes through each playlist in playlists, 
-- and then through each item in the playlist, and checks if the item is an advert,
 -- if it is, it adds it to the list adsFromPlaylists
adsFromPlaylists = [item | list <- playlists, item <- list, isAdvert item]

--tasks 6.3-a
-- find the lengths of all items in playlist1 that are shorter than 20 seconds
shortItemLenghts1 = [item_length_secs item | item <- playlist1, item_length_secs item < 20] 

main =
    do
    printf "playlist1 = %s\n" (show playlist1)
    printf "lenghts1 = %s\n" (show lengths1)
    printf "playlist1noAds = %s\n" (show playlist1noAds)
    printf "shortItemLenghts1 = %s\n" (show shortItemLenghts1)
    putStrLn ""
    printf "playlist2 = %s\n" (show playlist2)
    printf "playlists = %s\n" (show playlists)
    printf "adsFromPlaylists = %s\n" (show adsFromPlaylists)

