| 項目                 | 備考                                                                       |
| -------------------- | -------------------------------------------------------------------------- |
| アプリケーション名   | ことパーク                                                                 |
| アプリケーション概要 | 言葉を再獲得するための練習ができます。主に失語症の方向けです。 |
| URL                  | https://kotopark.herokuapp.com/ |
| テスト用アカウント   | ログイン機能等を実装した場合は、ログインに必要な情報を記述。またBasic認証等を設けている場合は、そのID/Passも記述すること |
| 利用方法          | このアプリケーションの利用方法を記述。説明が長い場合は、箇条書きでリスト化すること。 |
| アプリケーションを作成した背景           | 失語症の方が退院後に継続して言葉のリハビリを続けられる方は少ない現状があります。リハビリは発症後最大６ヶ月間入院しリハビリできますが、退院後はリハビリの時間が極端に減少してしまいます。しかし失語症は発症後1年~3年ほどはリハビリの効果が期待されます。そこで楽しく言葉のリハビリが継続できるようこのアプリケーションを作成しました。 |
| 洗い出した要件              | 要件定義のリンク。  |
| 実装した機能についての画像やGIFおよびその説明 | 実装した機能について、それぞれどのような特徴があるのかを列挙する形で記述。画像はGyazoで、GIFはGyazoGIFで撮影すること。  |
| 実装予定の機能            | 洗い出した要件の中から、今後実装予定の機能がある場合は、その機能を記述。    |
| データベース設計         | ER図を添付。 |
| 画面遷移図 | 画面遷移図を添付。 |
| 開発環境 | 使用した言語・サービスを記述。|
| ローカルでの動作方法 | git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述。 |


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
| experience         | integer | null: false, default: 0 |

### Association

- has_many :trainings
- has_many :comments
- has_many :follow_friends, foreign_key: "follower_id", class_name: "Friend", dependent: :destroy
- has_many :follows, through: :follow_friends
- has_many :follower_friends, foreign_key: "follow_id", class_name: "Friend", dependent: :destroy
- has_many :followers, through: :follower_friends

## trainings テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| score  | integer    | null: false                    |

### Association

- belongs_to :user
- has_many :choices

## choices テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| trainings | references | null: false, foreign_key: true |
| question  | text       | null: false                    |
| answer    | boolean    |                                |

### Association

- belongs_to :training

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
