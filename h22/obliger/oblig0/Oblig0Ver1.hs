module Main where

import Oblig0Common
  ( applyFilter,
    highPassCutoff,
    hpf,
    lowPassCutoff,
    lpf,
    zeroCrossings
  )

-- Function that returns true if a step is detected
isStep :: Double -> Double -> Bool
isStep a b = b >= 0 && a < 0

sumData :: (Double, Double, Double) -> Double
sumData (a,b,c) = a + b + c

-- Recursively go through input file 2 lines at a time and run the isStep function, if true then putStrLn "Step!"
stepDetector :: [String] -> IO()
stepDetector [] = return ()
stepDetector [line] = return ()
stepDetector (x:y:xs) = do
    let data1 = sumData (read x :: (Double, Double, Double))
    let data2 = sumData (read y :: (Double, Double, Double))
    let filtered1 = head $ applyFilter (hpf highPassCutoff) $ applyFilter (lpf lowPassCutoff) $ repeat data1
    let filtered2 = head $ applyFilter (hpf highPassCutoff) $ applyFilter (lpf lowPassCutoff) $ repeat data2
    putStrLn $ show filtered1
    putStrLn $ show filtered2
    if (isStep filtered1 filtered2)
    then do
        putStrLn "Step!"
        stepDetector (y:xs)
    else stepDetector (y:xs)


main = do
    input <- getContents
    stepDetector (lines input)