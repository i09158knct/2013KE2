abstract class AnimalTree
case class Leaf(name: String) extends AnimalTree
case class Branch(question: String, yesTree: AnimalTree, noTree: AnimalTree)
  extends AnimalTree

val initBase: AnimalTree =
  Branch("背骨があるか",
    Branch("温血動物か",
      Branch("こどもを母乳で育てるか",
        Branch("水中に住んでいるか",
          Leaf("いるか"),
          Branch("一般に飼い慣らされているか",
            Leaf("いぬ"),
            Leaf("とら"))),
        Branch("飛べるか",
          Leaf("こまどり"),
          Leaf("にわとり"))),
      Branch("えらを持っていて、一生水中で生活するか",
        Leaf("まぐろ"),
        Branch("最初はえらで、そのうち肺呼吸をするようになるか",
          Leaf("かえる"),
          Branch("足があるか",
            Leaf("わに"),
            Leaf("へび"))))),
    Branch("飛べるか",
      Leaf("か"),
      Leaf("みみず")))

def yesOrNo(question: String): Boolean = {
  print(question + " (y/n)? ")
  readLine() == "y"
}

def askAnimal(animalTree: AnimalTree): String = animalTree match {
  case Leaf(animal) => animal
  case Branch(question, yesTree, noTree) =>
    if (yesOrNo(question))
      askAnimal(yesTree)
    else
      askAnimal(noTree)
}

val animal = askAnimal(initBase)
print(animal)
