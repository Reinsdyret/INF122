module Main where

import Oblig0Common
  ( applyFilter,
    highPassCutoff,
    hpf,
    lowPassCutoff,
    lpf,
    zeroCrossings,
    extend
  )

-- Function that returns true if a step is detected
isStep :: Double -> Double -> Bool
isStep a b = b >= 0 && a < 0

sumData :: (Double, Double, Double) -> Double
sumData (a,b,c) = a + b + c

-- Recursively go through input file 2 lines at a time and run the isStep function, if true then putStrLn "Step!"
stepDetector :: Double -> Double -> IO()
stepDetector x y
  | isStep x y = putStrLn "Step!"
  | otherwise = return ()

filterDaData :: Double -> Double
filterDaData summedData = let
  processedData =
        applyFilter (hpf highPassCutoff) $
          applyFilter (lpf lowPassCutoff) $
            extend [summedData]
  in head processedData

-- doTheLines :: [String] -> IO ()
-- doTheLines linesOfData = do
--   let filtered = filterDaData (head linesOfData)
--   let filtered2 = filterDaData (linesOfData !! 1)
--   stepDetector filtered filtered2
--   doTheLines (drop 2 linesOfData)

main :: IO ()
main = do
  -- Read user data
  input <- getLine
  input2 <- getLine
  let data1 = read input :: (Double, Double, Double)
  let data2 = read input2 :: (Double, Double, Double)

  stepDetector (filterDaData $ sumData data1) (filterDaData $ sumData data2)
  main
  
