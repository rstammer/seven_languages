module Day1 where
  import Data.List

  -- Philosophical question:
  -- Are all elements of an empty list even?
  -- Are all elements of an empty list odd?
  -- Following my naive sense of formal logic,
  -- both has to be true.
  allEven1 [] = True
  allEven1 (x:xs) = (mod x 2) == 0 && (allEven1 xs)

  allEven2 list = (length odds) == 0 where
    odds = filter isOdd list
    isOdd x = mod x 2 /= 0

  reverseList [] = []
  reverseList (x:xs) = (reverse xs) ++ [x]

  colorCombos colors = nubBy glue [(x,y) | x <- colors, y <- colors, x /= y] where
    glue x y = fst(x) == snd(y) && fst(y) == snd(x)

  multiplicationTable a b = [(x, y, x*y) | x <- [a..b], y <- [a..b]]
