import System.Environment (getArgs)
import Day1


main :: IO ()
main = do
    (filename:_) <- getArgs
    raw <- readFile filename
    let parsed = map read $ lines raw :: [Int]
    print $ Day1.countIncrements parsed
    print $ Day1.countIncrements (Day1.grouper3 parsed)


