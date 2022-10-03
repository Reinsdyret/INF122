module Week41Exercise1 where

import Data.Map (Map)
import qualified Data.Map as Map
import Data.Set (Set)
import qualified Data.Set as Set

type Graph n = Map n (Set n)


disjoint :: (Ord a) => Set a -> Set a -> Bool
disjoint a b = Set.null $ Set.intersection a b
