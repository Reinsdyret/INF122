module Week42Exercise1 where

import Data.Either (fromLeft, fromRight)

fromLeftAndRight :: (Either a b -> c) -> (a -> c, b -> c)
fromLeftAndRight original = (leftFunc, rightFunc)
    where
        leftFunc aVal = original (Left aVal)
        rightFunc bVal = original (Right bVal)