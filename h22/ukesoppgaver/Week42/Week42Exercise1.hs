module Week42Exercise1 where

import Data.Either (fromLeft, fromRight)

fromLeftAndRight :: (Either a b -> c) -> (a -> c, b -> c)
fromLeftAndRight thing = (fromLeft 1 . thing, fromRight 1 thing)