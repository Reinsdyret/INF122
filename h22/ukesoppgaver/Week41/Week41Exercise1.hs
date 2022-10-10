module Week41Exercise1 where

import Data.Map (Map)
import qualified Data.Map as Map
import Data.Set (Set)
import qualified Data.Set as Set

import Data.Maybe ( isNothing, fromMaybe )

type Graph n = Map n (Set n)


disjoint :: (Ord a) => Set a -> Set a -> Bool
disjoint a b = Set.null $ Set.intersection a b

hasCycle' :: (Ord n) => Graph n -> Set n -> n -> Bool
hasCycle' graph searched currentNode
    | isNothing (Map.lookup currentNode graph) = False
    | otherwise = do
        let Just connected = Map.lookup currentNode graph
        if disjoint searched connected then or (map (hasCycle' graph (Set.union searched (Set.singleton currentNode))) (Set.toList (fromMaybe Set.empty (Map.lookup currentNode graph))))
        else True

hasCycle :: (Ord n) => Graph n -> n -> Bool
hasCycle graph node = do
    let Just currentNode = Map.lookup node graph
    hasCycle' graph currentNode currentNode
