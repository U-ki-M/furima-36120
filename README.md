# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false               |
| encrypted_password | string  | null: false, unique: true |
| surname            | string  | null: false               |
| first_name         | string  | null: false               |
| kana_surname       | string  | null: false               |
| kana_first_name    | string  | null: false               |
| dob_year           | integer | null: false               |
| dob_month          | integer | null: false               |
| dob_date           | integer | null: false               |

### Association

- has_many :items
- has_many :sales

##  items テーブル

| Column      | Type       | Options                         |
| ----------- | ---------- | ------------------------------- |
| title       | string     | null: false                     |
| text        | text       | null: false                     |
| category    | text       | null: false                     |
| condition   | integer    | null: false                     |
| from        | integer    | null: false                     |
| timeline    | integer    | null: false                     |
| price       | integer    | null: false                     |
| user_id     | references | null: false, foreign_key: true  |


### Association

- has_one :sale
- belongs_to :user

## sales テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user_id      | references | null: false, foreign_key: true |
| item_id      | references | null: false, foreign_key: true |

### Association

- has_one :sale
- belongs_to :item
- belongs_to :user

## shipments テーブル

| Column       | Type       | Options                         |
| ------------ | ---------- | ------------------------------- |
| postal       | integer    | null: false                     |
| prefecture   | integer    | null: false                     |
| city         | string     | null: false                     |
| street       | string     | null: false                     |
| bldg         | string     | null: true                      |
| tel          | integer    | null: false                     |
| sale_id      | references | null: false, foreign_key: true  |

### Association

- belongs_to :sale