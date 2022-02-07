const QuestionSet = () => {
  let Question = [
    ["/assets/apple.png",
    "ズボン",
    "りんご",
    "時計",
    "電話",
    "2"],
    ["/assets/pc.png",
    "雪",
    "お腹",
    "パソコン",
    "ちくわ",
    "3"],
    ["/assets/cop.png",
    "塩",
    "まつ毛",
    "500円玉",
    "コップ",
    "4"],
    ["/assets/fish.png",
    "ピラミッド",
    "魚",
    "カラス",
    "石",
    "2"],
    ["/assets/cat.png",
    "目",
    "猫",
    "スプーン",
    "兄",
    "2"],
    ["/assets/socks.png",
    "本",
    "花",
    "はさみ",
    "靴下",
    "4"],
    ["/assets/bag.png",
    "かばん",
    "地球",
    "ボンド",
    "ペンギン",
    "1"],
    ["/assets/chingensai.png",
    "タコライス",
    "学校",
    "ちんげん菜",
    "カーペット",
    "3"],
    ["/assets/clock.png",
    "鉛筆",
    "お茶",
    "ねずみ",
    "時計",
    "4"],
    ["/assets/glasses.png",
    "眼鏡",
    "電話",
    "消しゴム",
    "太陽",
    "1"],
  ];
  // 問題を表示するオブジェクトを取得する
  let Q = document.getElementById('_question');
  // 回答を表示するオブジェクトを取得する
  let A1 = document.getElementById('_answer_1');
  let A2 = document.getElementById('_answer_2');
  let A3 = document.getElementById('_answer_3');
  let A4 = document.getElementById('_answer_4');
  // 正解数を保持する値
  let Correct = 0;
  // 現在の問題数
  let Qcnt = 0;
  // 問題を画面に表示する処理
  function Q_Set() {
    Q.setAttribute('src',Question[Qcnt][0]);
    A1.textContent = Question[Qcnt][1];
    A2.textContent = Question[Qcnt][2];
    A3.textContent = Question[Qcnt][3];
    A4.textContent = Question[Qcnt][4];
  };
  Q_Set();
  // 回答ボタンを押したときの処理
  function answerCheck(ans) {
    if(ans == Question[Qcnt][5]) {
      alert("正解");
      Correct++;
    } else {
      alert("不正解");
    }
    Qcnt++;
    if (Qcnt == Question.length) {
      let E = document.getElementById('_end')
      Q.remove()
      E.innerHTML = `お疲れ様でした！10問中、正解数は${Correct}でした。`;
      A1.textContent = "";
      A2.textContent = "";
      A3.textContent = "";
      A4.textContent = "";
      document.getElementById("_answer_1").remove()
      document.getElementById("_answer_2").remove()
      document.getElementById("_answer_3").remove()
      document.getElementById("_answer_4").remove()
      document.getElementById("title").remove()
    } else {
      // 画面に表示
      Q_Set();
    }
  }
  window.answerCheck = answerCheck;
};

window.addEventListener('DOMContentLoaded', QuestionSet);