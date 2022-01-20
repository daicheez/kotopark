| 項目                           | 備考                                                                       |
| ------------------------------ | -------------------------------------------------------------------------- |
| アプリケーション名             | ことパーク                                                                 |
| アプリケーション概要           | 言葉を再獲得するための練習ができます。主に失語症の方向けです。             |
| URL                            | https://kotopark.herokuapp.com/                                            |
| テスト用アカウント             | Basic認証 ID:admin 
          Pass:0987
メールアドレス: 1@com
パスワード: a00000 |
| 利用方法                       | このアプリケーションの利用方法を記述。説明が長い場合は、箇条書きでリスト化すること。 |
| アプリケーションを作成した背景 | 自宅でも簡単に楽しく言葉のリハビリを継続できるアプリケーションを作りました。失語症の方が退院後に継続して言葉のリハビリを続けられる方は少ない現状があります。リハビリは発症後最大６ヶ月間入院しリハビリできますが、退院後はリハビリの時間が極端に減少してしまいます。しかし失語症は発症後1年~3年ほどはリハビリの効果が期待されます。そこで楽しく言葉のリハビリが継続できるようこのアプリケーションを開発しました。 |
| 洗い出した要件                 | https://docs.google.com/spreadsheets/d/1L3ZqyrBGRjLzt1EtFq7l8OO7sPdJ05yOhXTGno8w9sg/edit?usp=sharing |
| 実装した機能についての説明 | ・新規登録機能  [![Image from Gyazo](https://i.gyazo.com/0cdc58eddd2977c07984c5b199aa2a27.gif)](https://gyazo.com/0cdc58eddd2977c07984c5b199aa2a27)  ・ログイン機能  [![Image from Gyazo](https://i.gyazo.com/a7ad0750ca939d6783531e343037c1e4.gif)](https://gyazo.com/a7ad0750ca939d6783531e343037c1e4)  ・訓練機能  [![Image from Gyazo](https://i.gyazo.com/d3e2702d2cbfac78c06793b7c1ac8b91.gif)](https://gyazo.com/d3e2702d2cbfac78c06793b7c1ac8b91)  （訓練機能は最後まで実装できていません） |
| 実装予定の機能                 | 今後は訓練機能を10問最後まで実施できるようにしますその後は訓練の問題数を充実させながら、・友達機能・コメント機能・ランダムユーザー表示機能・訓練のレコメンド機能を実装していきます。 |
| データベース設計               | [![Image from Gyazo](https://i.gyazo.com/2d6fd0c02590ead8e2516e5b2630cfc3.png)](https://gyazo.com/2d6fd0c02590ead8e2516e5b2630cfc3) |
| 画面遷移図                     | [![Image from Gyazo](https://i.gyazo.com/7fb6719eb604e36b3ccde9ea84994193.png)](https://gyazo.com/7fb6719eb604e36b3ccde9ea84994193) |
| 開発環境                       | Ruby,Ruby on Rails,HTML/CSS,MySQL,Github,AWS,Visual Studio Code |
| ローカルでの動作方法           | 以下、コマンドを実行して下さい。  % git clone https://github.com/daicheez/kotopark.git % cd ユーザー名/kotopark  % bundle install  % yarn install |


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

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| level      | text       | null: false                    |
| score      | integer    | null: false                    |

### Association

- belongs_to :user
- has_many :questions

## questions テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| training   | references | null: false, foreign_key: true |
| content    | text       | null: false                    |
| point      | integer    | null: false                    |

### Association

- belongs_to :training
- has_many :choices

## choices テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| question | references | null: false, foreign_key: true |
| chose    | text       | null: false                    |
| answer   | boolean    | null: false                    |

### Association

- belongs_to :question

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
