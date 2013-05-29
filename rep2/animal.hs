import System.IO

data Tree a = Leaf a | Node a (Tree a) (Tree a)
  deriving (Eq, Ord, Read, Show)

initBase =
  Node "背骨があるか"
    (Node "温血動物か"
      (Node "こどもを母乳で育てるか"
        (Node "水中に住んでいるか"
          (Leaf "いるか")
          (Node "一般に飼い慣らされているか"
            (Leaf "いぬ")
            (Leaf "とら")))
        (Node "飛べるか"
          (Leaf "こまどり")
          (Leaf "にわとり")))
      (Node "えらを持っていて、一生水中で生活するか"
        (Leaf "まぐろ")
        (Node "最初はえらで、そのうち肺呼吸をするようになるか"
          (Leaf "かえる")
          (Node "足があるか"
            (Leaf "わに")
            (Leaf "へび")))))
    (Node "飛べるか"
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
askAnimal (Node question yesTree noTree) = do
  sayYes <- yesOrNo question
  if sayYes
    then askAnimal yesTree
    else askAnimal noTree


main = do
  animal <- askAnimal initBase
  putStrLn animal
  return ()
