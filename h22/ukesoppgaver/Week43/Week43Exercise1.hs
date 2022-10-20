module Week43Exercise1 where

data RoseTree a = Branch a [RoseTree a]
  deriving (Eq, Show)

instance Functor RoseTree where
  fmap f (Branch a rest) = Branch (f a) (fmap (fmap f) rest)

sumNodes :: (Num a) => RoseTree [a] -> RoseTree a
sumNodes roseTree = fmap (+) roseTree
