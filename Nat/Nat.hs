module Nat where

data Nat = Cero | Suc Nat deriving (Show)

suma :: (Nat, Nat) -> Nat
suma(Cero, x) = x
suma(Suc(x), y) = suma(x, Suc(y))
