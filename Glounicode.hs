module Glounicode (glouencode, gloudecode) where

import Data.Char (chr, ord)

{- Encoding -}
glouencode :: String -> [String]
glouencode x = concatMap glouencodeOne (map ord x)

glouencodeOne :: Int -> [String]
glouencodeOne n = encodeGlouNum (length l) $ glouEncodeWords l n []
	where
		l = glouFactors n

glouEncodeWords :: [Int] -> Int -> [String] -> [String]
glouEncodeWords []     nb l = l ++ [intToGlou nb]
glouEncodeWords (x:xs) 0  l = glouEncodeWords xs 0            (l ++ [intToGlou 0])
glouEncodeWords (x:xs) nb l = glouEncodeWords xs (nb `mod` x) (l ++ [intToGlou (nb `div` x)])

encodeGlouNum :: Int -> [String] -> [String]
encodeGlouNum nb (x:xs) = ('g' : take nb (cycle "l") ++ drop 1 x):xs

glouFactors :: Int -> [Int]
glouFactors nb
	| nb < 128 = []
	| otherwise = reverse $ takeWhile (< nb) (64:[64^2,64^3..])


{- Decoding -}
gloudecode :: [String] -> String
gloudecode l = gloudecode' l ""

gloudecode' :: [String] -> String -> String
gloudecode' [] r = r
gloudecode' (x:xs) r = gloudecode' (drop (nb+1) (x:xs)) (r ++ [chr (gloudecodeOne nb (take (nb+1) (x:xs)))])
	where
		nb = nbGlou x

gloudecodeOne :: Int -> [String] -> Int
gloudecodeOne nb l = foldl (\acc (n,i) ->  acc + adaptToPos (nb - i) n) 0 glouint
	where
		glouint = zip (map glouToInt l) [0,1..]

{- Utilities functions -}
nbGlou :: String -> Int
nbGlou ('g':'l':x) = countElem 'l' x

intToGlou :: Int -> String
intToGlou x = "glo" ++ take o (cycle "o") ++ "u" ++ take u (cycle "u")
	where (o,u) = x `divMod` 10

glouToInt :: String -> Int
glouToInt ('g':'l':s) =  10 * (countElem 'o' s - 1) + countElem 'u' s - 1

countElem :: (Eq a) => a -> [a] -> Int
countElem e = length . filter (== e)

adaptToPos :: Int -> Int -> Int
adaptToPos nb n = n * (2 ^ (6 * nb))
