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
