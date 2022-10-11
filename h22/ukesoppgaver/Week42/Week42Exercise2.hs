module Week42Exercise2 where

-- The way of doing this function was found on: https://stackoverflow.com/a/70745811/9113802
reverseWord :: String -> String
reverseWord = unwords . map reverse . words

sumIsEven :: Integer -> Integer -> Bool
sumIsEven = \a b -> even $ a+b