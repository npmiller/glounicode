module Glounicode (glouencode, gloudecode) where

import Data.Char (chr, ord)

glouencode :: String -> [String]
glouencode x = concatMap glouencodeOne (map ord x)

gloudecode :: [String] -> String
gloudecode l = gloudecode' l []

gloudecode' [] d = d
gloudecode' (x:xs) d = gloudecode' (drop (nb+1) (x:xs)) (d ++ [chr (gloudecodeOne nb (take (nb+1) (x:xs)))])
	where
		nb = nbGlou x

glouencodeOne n = encodeGlouNum (length l) $ glouEncodeWords l n []
	where
		l = glouFactors n

encodeGlouNum nb (x:xs) = ("g" ++ take nb (cycle "l") ++ drop 1 x):xs

glouEncodeWords [] nb l = l ++ [intToGlou nb]
glouEncodeWords (x:xs) 0 l = glouEncodeWords xs 0 (l ++ [intToGlou 0])
glouEncodeWords (x:xs) nb l = glouEncodeWords xs (nb `mod` x) (l ++ [intToGlou (nb `div` x)])

glouFactors nb
	| nb < 128 = reverse $ takeWhile (< nb) (128:[64^2,64^3..])
	| otherwise = reverse $ takeWhile (< nb) (64:[64^2,64^3..])

gloudecodeOne nb l = foldl (\acc (n,i) ->  acc + adaptToPos (nb - i) n) 0 glouint 
	where
		glouint = zip (map glouToInt l) [0,1..]

nbGlou ('g':'l':x) = countElem x 'l'

intToGlou x = 'g': 'l': "o" ++ take o (cycle "o") ++ "u" ++ take u (cycle "u")
	where 
		o = x `div` 10
		u = x `mod` 10

glouToInt ('g':'l':s) =  10 * (countElem s 'o' - 1) + (countElem s 'u' - 1)

countElem l e = length $ filter (== e) l

adaptToPos nb n = n * (2 ^ (6 * nb))
