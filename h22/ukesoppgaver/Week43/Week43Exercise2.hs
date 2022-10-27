{-# LANGUAGE FlexibleInstances #-}
module Week43Exercise2 where

class IntegerGraph g where
  emptyGraph :: g
  insertNode :: Integer -> g -> g
  insertEdge :: Integer -> Integer -> g -> g
  nodeInGraph :: Integer -> g -> Bool
  edgeInGraph :: Integer -> Integer -> g -> Bool

data MyGraph = MyGraph [Integer] [(Integer, Integer)]
  deriving (Show, Eq)

instance IntegerGraph MyGraph where
  emptyGraph = MyGraph [] []
  insertNode u (MyGraph nodes edges) = MyGraph (u : nodes) edges
  insertEdge u v (MyGraph nodes edges) = MyGraph nodes ((u,v) : edges)
  nodeInGraph u (MyGraph nodes edges) = elem u nodes
  edgeInGraph u v (MyGraph nodes edges) = elem (u,v) edges

graph :: (IntegerGraph g) => g
graph =
  let graphWithNodes = insertNode 8 
    (insert 6 
    (insert 5 
    (insert 3
    (insert 1 emptyGraph))))

 in insertEdge 1 6 (insertEdge 1 8 (insertEdge 5 1 (insertEdge 5 8 (insertEdge 8 5 graphWithNodes))))
