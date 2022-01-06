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

### Association

- has_one :easy_training
- has_one :medium_training
- has_one :hard_training
- has_many :comments
- has_many :users, through: :friends

## easy_trainings テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| easy_progress | integer    |                               |
| user          | references | null:false, foreign_key: true |

### Association

- has_one :user

## medium_trainings テーブル

| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| medium_progress | integer    |                               |
| user            | references | null:false, foreign_key: true |

### Association

- has_one :user

## hard_trainings テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| hard_progress | integer    |                               |
| user          | references | null:false, foreign_key: true |

### Association

- has_one :user

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | string     | null: false                    |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
