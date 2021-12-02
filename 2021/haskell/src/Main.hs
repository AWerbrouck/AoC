import System.Environment (getArgs)
import Day2
import Data.List

main :: IO ()
main = do
    (filename:_) <- getArgs
    raw <- readFile filename
    let parsed = lines raw
    -- print $ Day1.countIncrements parsed
    -- print $ Day1.countIncrements (Day1.grouper3 parsed)
    print $ Day2.part1 parsed
    print $ Day2.part2 parsed


