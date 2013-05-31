import System.IO

data Tree a = Leaf a | Branch a (Tree a) (Tree a)
  deriving (Eq, Ord, Read, Show)

initBase =
  Branch "背骨があるか"
    (Branch "温血動物か"
      (Branch "こどもを母乳で育てるか"
        (Branch "水中に住んでいるか"
          (Leaf "いるか")
          (Branch "一般に飼い慣らされているか"
            (Leaf "いぬ")
            (Leaf "とら")))
        (Branch "飛べるか"
          (Leaf "こまどり")
          (Leaf "にわとり")))
      (Branch "えらを持っていて、一生水中で生活するか"
        (Leaf "まぐろ")
        (Branch "最初はえらで、そのうち肺呼吸をするようになるか"
          (Leaf "かえる")
          (Branch "足があるか"
            (Leaf "わに")
            (Leaf "へび")))))
    (Branch "飛べるか"
      (Leaf "か")
      (Leaf "みみず"))

yesOrNo :: String -> IO Bool
yesOrNo question = do
  putStr question
  putStr " (y/n)? "
  hFlush stdout
  answer <- getLine
  return $ answer == "y"

askAnimal :: Tree String -> IO String
askAnimal (Leaf animal) = return animal
askAnimal (Branch question yesTree noTree) = do
  sayYes <- yesOrNo question
  if sayYes
    then askAnimal yesTree
    else askAnimal noTree


main = do
  animal <- askAnimal initBase
  putStrLn animal
  return ()
