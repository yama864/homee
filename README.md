# テーブル設計

## users テーブル

| Column             | Type       | Options                   |
| ------------------ | ---------- | ------------------------- |
| nickname           | string     | null: false               |
| email              | string     | null: false, unique: true |
| encrypted_password | string     | null: false               |
| last_name          | string     | null: false               |
| first_name         | string     | null: false               |
| last_name_kana     | string     | null: false               |
| first_name_kana    | string     | null: false               |
| relation_id        | integer    | null: false               |
| group              | references | foreign_key: true         |

### Association

- has_many :comments
- has_many :schedules
- has_one :group

## groups テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| group_name          | string     | null: false                    |
| group_password      | string     | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| text                | text       | null: false                    |
| audio               | text       | null: false                    |
| user                | references | null: false, foreign_key: true |
| group               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :group

## schedules テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| child_name          | string     | null: false                    |
| start_date          | datetime   | null: false                    |
| end_date            | datetime   | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user

