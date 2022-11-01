module Model (TextModel
             ,createModel
             ,nextDistribution) where
import Control.Monad
import Data.List
import Control.Arrow

import qualified Data.Map as Map
import Data.Map (Map)

import NGram

-- The type for our Markov process text model.
type TextModel = Map NGram (Map Char Weight , Weight)

-- The empty model with no n-grams.
emptyModel :: TextModel
emptyModel = Map.empty

-- Update a model with a new n-gram followed by a character.
increaseWeight :: NGram -> Char -> TextModel -> TextModel
increaseWeight ngram next model
  | not (Map.member ngram model) = Map.insert ngram (Map.fromList [(next, 1)], 1) model 
  | otherwise = do
    let Just (charModel, weight) = Map.lookup ngram model
    let newNgramModel = Map.insertWith (+) next 1 charModel
    let newWeight = weight + 1
    Map.insert ngram (newNgramModel, newWeight) model

-- The distribution of next n-grams after a given one.
nextDistribution :: TextModel -> NGram -> Maybe ([(NGram, Weight)],Weight)
nextDistribution model current = Nothing

-- Create an n-gram model from a string.
createModel :: Integer -> String -> TextModel
createModel n str = emptyModel

