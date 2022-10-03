module Week41Exercise2 where

import Data.Map (Map)
import qualified Data.Map as Map

data Expr a
  = Var a
  | Lit Integer
  | Mul (Expr a) (Expr a)
  | Add (Expr a) (Expr a)
  deriving (Eq, Show)
