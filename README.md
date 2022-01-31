| 項目                           | 内容                                                                       |
| ------------------------------ | -------------------------------------------------------------------------- |
| アプリケーション名             | ことパーク (※制作途中のアプリです)                                                                |
| アプリケーション概要           | 言葉を再獲得するためのリハビリができます。主に失語症の方向けです。         |
| URL                            | https://kotopark.herokuapp.com/                                            |
| テスト用アカウント             | Basic認証<br> ID: admin<br> Pass: 0987<br>メールアドレス: 1@com<br>パスワード: a00000 |
| 利用方法                       | ・現在はログイン状態に関係なく使用できます。<br>1.ヘッダーの「訓練する」ボタンをクリック<br>2.「読む」をクリック<br>3.「イメージ→文字」をクリック<br>4.「単語 選択肢4つ」をクリック<br>5.（画像が表示されない場合ページリロードをお願いします）問題が始まりますので、回答を選択肢から適当なものを選んでいきます。<br>10問解き終えると今の仕様では終了です。 |
| アプリケーションを作成した背景 | 自宅でも簡単に楽しく言葉のリハビリを継続できるアプリケーションを作りました。<br>失語症の方が退院後に継続して言葉のリハビリを続けられる方は少ない現状があります。リハビリは発症後最大６ヶ月間入院しリハビリできますが、退院後はリハビリの時間が極端に減少してしまいます。しかし失語症は発症後1年~3年ほどはリハビリの効果が期待されます。<br>そこで楽しく言葉のリハビリが継続できるようこのアプリケーションを開発しました。<br>この問題を解いていくことでマイページの植物が少しづつ成長していきます。自身のやってきたリハビリが「見える化」することで、言葉が不自由な方でも理解することができます。 |
| 洗い出した要件                 | https://docs.google.com/spreadsheets/d/1L3ZqyrBGRjLzt1EtFq7l8OO7sPdJ05yOhXTGno8w9sg/edit?usp=sharing |
| 実装した機能についての説明     | ・新規登録機能<br>[![Image from Gyazo](https://i.gyazo.com/6d404b45ee27749c93d108a0533580e5.gif)](https://gyazo.com/6d404b45ee27749c93d108a0533580e5)<br>・ログイン機能  [![Image from Gyazo](https://i.gyazo.com/a7ad0750ca939d6783531e343037c1e4.gif)](https://gyazo.com/a7ad0750ca939d6783531e343037c1e4)<br>・訓練機能（訓練機能は最後まで実装できていません）<br>[![Image from Gyazo](https://i.gyazo.com/d3e2702d2cbfac78c06793b7c1ac8b91.gif)](https://gyazo.com/d3e2702d2cbfac78c06793b7c1ac8b91)<br>訓練進捗機能(問題に正答するごとに植物が成長します)<br>[![Image from Gyazo](https://i.gyazo.com/6d3f6dffb58db8afd26c5ae25cba8f55.gif)](https://gyazo.com/6d3f6dffb58db8afd26c5ae25cba8f55) |
| 実装予定の機能                 | 今後は訓練の記録機能・提示問題のランダム表示機能を実装していきます。その後は訓練の問題数を充実させながら、・セラピスト患者管理機能・友達機能・コメント機能・ランダムユーザー表示機能・訓練のレコメンド機能を実装していきます。 |
| データベース設計               | [![Image from Gyazo](https://i.gyazo.com/3e086ab02ac7fa624e822aac2a11c4fb.png)](https://gyazo.com/3e086ab02ac7fa624e822aac2a11c4fb) |
| 画面遷移図                     | [![Image from Gyazo](https://i.gyazo.com/6c4c2ed9e5fe2b41e978a21f9190771c.png)](https://gyazo.com/6c4c2ed9e5fe2b41e978a21f9190771c) |
| 開発環境                       | Ruby, Ruby on Rails, HTML/CSS, JavaScript, Github, Visual Studio Code, Sequel pro |
| ローカルでの動作方法           | 以下、コマンドを実行して下さい。<br>% git clone https://github.com/daicheez/kotopark.git  <br>% cd ユーザー名/kotopark  <br>% bundle install  <br>% yarn install |


<br>
# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| name               | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| age_id             | integer | null: false |
| gender_id          | integer | null: false |
| place_id           | integer | null: false |
| hobby              | string  |             |
| job                | string  |             |
| profile            | text    |             |
| experience_point   | integer | null: false, default: 0 |

### Association

- has_many :trainings
- has_many :comments
- has_many :follow_friends, foreign_key: "follower_id", class_name: "Friend", dependent: :destroy
- has_many :follows, through: :follow_friends
- has_many :follower_friends, foreign_key: "follow_id", class_name: "Friend", dependent: :destroy
- has_many :followers, through: :follower_friends

## trainings テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| training_at  | string     | null: false                    |
| score        | integer    | null: false                    |

### Association

- belongs_to :user

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | string     | null: false                    |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## friends テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| follow   | integer    |                                |
| follower | integer    |                                |

### Association

- belongs_to :follow, class_name: "User"
- belongs_to :follower, class_name: "User"
