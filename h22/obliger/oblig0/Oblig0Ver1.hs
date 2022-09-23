module Main where

import Oblig0Common
  ( applyFilter,
    highPassCutoff,
    hpf,
    lowPassCutoff,
    lpf,
    zeroCrossings,
  )
import System.IO

-- Function that returns true if a step is detected
isStep :: Double -> Double -> Bool
isStep a b = b >= 0 && a < 0


-- Worked with Erling Bratli on this task were we solved it together
stepDetector :: [Double] -> IO ()
stepDetector [] = return ()
stepDetector (x:xs)
-- Cheating way to see if list repeats
  | x == head xs = return ()
  | isStep x (head xs) = do
    putStrLn "Step!"
    hFlush stdout
    stepDetector xs
  | otherwise = stepDetector xs

main = do
  -- Read user data
  input <- getContents
  -- Process data using filters
  let datapoints = map read (lines input) :: [(Double, Double, Double)]
  let summedData = map (\(a, b, c) -> a + b + c) datapoints
  let dataLength = length summedData
  let processedData =
        applyFilter (hpf highPassCutoff) $
          applyFilter (lpf lowPassCutoff) $
            summedData
  -- Print step for each step in processedData
  stepDetector processedData