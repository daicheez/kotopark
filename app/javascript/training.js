window.addEventListener('DOMContentLoaded', function() {
  let Question = [
    ["/assets/apple.png",
    "1. ズボン",
    "2. りんご",
    "3. 時計",
    "4. 電話",
    "2"],
    ["/assets/pc.png",
    "1. 雪",
    "2. お腹",
    "3. パソコン",
    "4. ちくわ",
    "3"],
    ["/assets/cop.png",
    "1. 塩",
    "2. まつ毛",
    "3. 500円玉",
    "4. コップ",
    "4"],
    ["/assets/fish.png",
    "1. ピラミッド",
    "2. 魚",
    "3. カラス",
    "4. 石",
    "2"],
    ["/assets/cat.png",
    "1. 目",
    "2. 猫",
    "3. スプーン",
    "4. 兄",
    "2"],
    ["/assets/socks.png",
    "1. 本",
    "2. 花",
    "3. はさみ",
    "4. 靴下",
    "4"],
    ["/assets/bag.png",
    "1. かばん",
    "2. 地球",
    "3. ボンド",
    "4. ペンギン",
    "1"],
    ["/assets/chingensai.png",
    "1. タコライス",
    "2. 学校",
    "3. ちんげん菜",
    "4. カーペット",
    "3"],
    ["/assets/clock.png",
    "1. 鉛筆",
    "2. お茶",
    "3. ねずみ",
    "4. 時計",
    "2"],
    ["/assets/apple.png",
    "1. ズボン",
    "2. りんご",
    "3. 時計",
    "4. 電話",
    "2"],
  ];
  // 問題を表示するオブジェクトを取得する
  let Q = document.getElementById('_question');
  // 問題を表示するオブジェクトを取得する
  let A1 = document.getElementById('_ans1');
  let A2 = document.getElementById('_ans2');
  let A3 = document.getElementById('_ans3');
  let A4 = document.getElementById('_ans4');
  // 正解数を保持する値
  let Correct = 0;
  // 現在の問題数
  let Qcnt = 0;
  // 問題を画面に表示する処理
  function Q_Set() {
    Q.innerHTML = _question.setAttribute('src',Question[Qcnt][0]);
    A1.textContent = Question[Qcnt][1];
    A2.textContent = Question[Qcnt][2];
    A3.textContent = Question[Qcnt][3];
    A4.textContent = Question[Qcnt][4];
  };
  // 画面に表示
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
      Q.innerHTML = `お疲れ様でした！10問中、正解数は${Correct}でした。`;
      A1.textContent = "";
      A2.textContent = "";
      A3.textContent = "";
      A4.textContent = "";
    } else {
      // 画面に表示
      Q_Set();
    }
  }
  window.answerCheck = answerCheck;
});