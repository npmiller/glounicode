module Glounicode (glouencode, gloudecode) where

import Data.Char (chr, ord)

glouencode :: [Char] -> [[Char]]
glouencode x = concat $ map glouencode_one (map ord x)

gloudecode :: [[Char]] -> [Char]
gloudecode l = gloudecode' l []

gloudecode' [] d = d
gloudecode' (x:xs) d = gloudecode' (drop (nb+1) (x:xs)) (d ++ [chr (gloudecode_one nb (take (nb+1) (x:xs)))])
	where
		nb = nb_glou x

glouencode_one n = encode_glou_num (length l) $ glou_encode_words l n []
	where 
		l = glou_factors n

encode_glou_num nb (x:xs) = ("g" ++ (take nb (cycle ['l'])) ++ (drop 1 x)):xs

glou_encode_words [] nb l = l ++ [int_to_glou nb]
glou_encode_words (x:xs) 0 l = glou_encode_words xs 0 (l ++ [int_to_glou 0])
glou_encode_words (x:xs) nb l = glou_encode_words xs (nb `mod` x) (l ++ [int_to_glou (nb `div` x)])

glou_factors nb
	| nb < 128 = reverse $ takeWhile (\x -> x < nb) (128:[64^2,64^3..])
	| otherwise = reverse $ takeWhile (\x -> x < nb) (64:[64^2,64^3..])

gloudecode_one nb l = foldl (\acc (n,i) ->  acc + (adapt_to_pos (nb - i) n)) 0 glouint 
	where
		glouint = zip (map glou_to_int l) [0,1..]

nb_glou ('g':'l':x) = count_elem x 'l'

int_to_glou x = 'g': 'l': ['o'] ++ take o (cycle ['o']) ++ ['u'] ++ take u (cycle ['u'])
	where 
		o = x `div` 10
		u = x `mod` 10

glou_to_int ('g':'l':s) =  10 * ((count_elem s 'o') - 1) + ((count_elem s 'u') - 1)

count_elem l e = length $ filter (\x -> x == e) l

adapt_to_pos nb n = n * (2 ^ (6 * nb))
