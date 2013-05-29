data Tree a = EmptyTree | Node a (Tree a) (Tree a)
  deriving (Eq, Ord, Read, Show)

initBase =
  Node "背骨があるか"
    (Node "温血動物か"
      (Node "こどもを母乳で育てるか"
        (Node "水中に住んでいるか"
          (Node "いるか" EmptyTree EmptyTree)
          (Node "一般に飼い慣らされているか"
            (Node "いぬ" EmptyTree EmptyTree)
            (Node "とら" EmptyTree EmptyTree)))
        (Node "飛べるか"
          (Node "こまどり" EmptyTree EmptyTree)
          (Node "にわとり" EmptyTree EmptyTree)))
      (Node "えらを持っていて、一生水中で生活するか"
        (Node "まぐろ" EmptyTree EmptyTree)
        (Node "最初はえらで、そのうち肺呼吸をするようになるか"
          (Node "かえる" EmptyTree EmptyTree)
          (Node "足があるか"
            (Node "わに" EmptyTree EmptyTree)
            (Node "へび" EmptyTree EmptyTree)))))
    (Node "飛べるか"
      (Node "か" EmptyTree EmptyTree)
      (Node "みみず" EmptyTree EmptyTree))

yesOrNo :: String -> IO Bool
yesOrNo question = do
  putStr question
  putStr " (y/n)? "
  answer <- getLine
  return $ answer == "y"

askAnimal :: Tree String -> IO String
askAnimal (Node animal EmptyTree EmptyTree) = return animal
askAnimal (Node question yesTree noTree) = do
  sayYes <- yesOrNo question
  if sayYes
    then askAnimal yesTree
    else askAnimal noTree


main = do
  animal <- askAnimal initBase
  putStrLn animal
  return ()
