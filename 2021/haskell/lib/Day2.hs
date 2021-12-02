module Day2 where
import Data.List


part1:: [String] -> Int
part1 s = x*y
  where (x:y:_) = driver1 s [0,0]

driver1:: [String] -> [Int] -> [Int]
driver1 xs d = foldl (flip parseLineP1) d xs

parseLineP1 :: String -> [Int] -> [Int]
parseLineP1 s (x:y:_)
  | "forward " `isPrefixOf` s = [ getInt s 8 + x, y]
  | "down " `isPrefixOf` s = [x ,getInt s 5+ y]
  | "up " `isPrefixOf` s = [ x, y - getInt s 3]
  | otherwise = [x,y]
parseLineP1 _ _ = [0]

part2:: [String] -> Int
part2 s = x*y
  where (x:y:a:_) = driver2 s [0,0,0]

driver2:: [String] -> [Int] -> [Int]
driver2 xs d = foldl (flip parseLineP2) d xs

parseLineP2 :: String -> [Int] -> [Int]
parseLineP2 s (x:y:a:_)
  | "forward " `isPrefixOf` s = [ getInt s 8 + x, getInt s 8*a+y, a]
  | "down " `isPrefixOf` s = [x ,y,getInt s 5 + a]
  | "up " `isPrefixOf` s = [ x, y, a - getInt s 3]
  | otherwise = [x,y,a]
parseLineP2 _ _ = [0]

getInt :: String ->Int  -> Int
getInt s p = read (drop p s) :: Int