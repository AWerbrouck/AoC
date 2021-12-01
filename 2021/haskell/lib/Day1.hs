module Day1 where


countIncrements :: [Int] -> Int
countIncrements (x:xs) = length .filter (>0) $ zipWith (-) xs (x:xs)

grouper3 :: [Int] -> [Int]
grouper3 (x:y:xys) = zipWith (+) (zipWith (+) (y:xys) (x:y:xys)) xys