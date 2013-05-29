initBase = [
  "背骨があるか"
  [
    "温血動物か"
    [
      "こどもを母乳で育てるか"
      [
        "水中に住んでいるか"
        "いるか"
        [
          "一般に飼い慣らされているか"
          "いぬ"
          "とら"
        ]
      ]
      [
        "飛べるか"
        "こまどり"
        "にわとり"
      ]
    ]
    [
      "えらを持っていて、一生水中で生活するか"
      "まぐろ"
      [
        "最初はえらで、そのうち肺呼吸をするようになるか"
        "かえる"
        [
          "足があるか"
          "わに"
          "へび"
        ]
      ]
    ]
  ]
  [
    "飛べるか"
    "か"
    "みみず"
  ]
]

yesOrNo = (prompt) ->
  confirm "#{prompt} (OK/Cancel)?"

askAnimal = (tree) ->
  currentTree = tree
  while typeof currentTree != "string"
    if yesOrNo currentTree[0]
      currentTree = currentTree[1]
    else
      currentTree = currentTree[2]

  return currentTree


do main = ->
  animal = askAnimal initBase
  alert animal


### output
var askAnimal, initBase, main, yesOrNo;

initBase = ["背骨があるか", ["温血動物か", ["こどもを母乳で育てるか", ["水中に住んでいるか", "いるか", ["一般に飼い慣らされているか", "いぬ", "とら"]], ["飛べるか", "こまどり", "にわとり"]], ["えらを持っていて、一生水中で生活するか", "まぐろ", ["最初はえらで、そのうち肺呼吸をするようになるか", "かえる", ["足があるか", "わに", "へび"]]]], ["飛べるか", "か", "みみず"]];

yesOrNo = function(prompt) {
  return confirm("" + prompt + " (OK/Cancel)?");
};

askAnimal = function(tree) {
  var currentTree;
  currentTree = tree;
  while (typeof currentTree !== "string") {
    if (yesOrNo(currentTree[0])) {
      currentTree = currentTree[1];
    } else {
      currentTree = currentTree[2];
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