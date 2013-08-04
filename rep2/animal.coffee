initBase =
  question: "背骨があるか"
  yes:
    question: "温血動物か"
    yes:
      question: "こどもを母乳で育てるか"
      yes:
        question: "水中に住んでいるか"
        yes: "いるか"
        no:
          question: "一般に飼い慣らされているか"
          yes: "いぬ"
          no: "とら"
      no:
        question: "飛べるか"
        yes: "こまどり"
        no: "にわとり"
    no:
      question: "えらを持っていて、一生水中で生活するか"
      yes: "まぐろ"
      no:
        question: "最初はえらで、そのうち肺呼吸をするようになるか"
        yes: "かえる"
        no:
          question: "足があるか"
          yes: "わに"
          no: "へび"
  no:
   question: "飛べるか"
   yes: "か"
   no: "みみず"

yesOrNo = (prompt) ->
  confirm "#{prompt} (OK/Cancel)?"

askAnimal = (tree) ->
  currentTree = tree
  while typeof currentTree != "string"
    if yesOrNo currentTree.question
      currentTree = currentTree.yes
    else
      currentTree = currentTree.no

  return currentTree


do main = ->
  animal = askAnimal initBase
  alert animal

###
var askAnimal, initBase, main, yesOrNo;

initBase = {
  question: '',
  yes: {
    question: "温血動物か",
    yes: {
      question: "こどもを母乳で育てるか",
      yes: {
        question: "水中に住んでいるか",
        yes: "いるか",
        no: {
          question: "一般に飼い慣らされているか",
          yes: "いぬ",
          no: "とら"
        }
      },
      no: {
        question: "飛べるか",
        yes: "こまどり",
        no: "にわとり"
      }
    },
    no: {
      question: "えらを持っていて、一生水中で生活するか",
      yes: "まぐろ",
      no: {
        question: "最初はえらで、そのうち肺呼吸をするようになるか",
        yes: "かえる",
        no: {
          question: "足があるか",
          yes: "わに",
          no: "へび"
        }
      }
    }
  },
  no: {
    question: "飛べるか",
    yes: "か",
    no: "みみず"
  }
};

yesOrNo = function(prompt) {
  return confirm("" + prompt + " (OK/Cancel)?");
};

askAnimal = function(tree) {
  var currentTree;

  currentTree = tree;
  while (typeof currentTree !== "string") {
    if (yesOrNo(currentTree.question)) {
      currentTree = currentTree.yes;
    } else {
      currentTree = currentTree.no;
    }
  }
  return currentTree;
};

(main = function() {
  var animal;

  animal = askAnimal(initBase);
  return alert(animal);
})();
###
