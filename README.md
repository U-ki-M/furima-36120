# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| surname            | string  | null: false               |
| first_name         | string  | null: false               |
| kana_surname       | string  | null: false               |
| kana_first_name    | string  | null: false               |
| dob                | date    | null: false               |


### Association

- has_many :items
- has_many :sales

##  items テーブル

| Column       | Type       | Options                         |
| ------------ | ---------- | ------------------------------- |
| title        | string     | null: false                     |
| text         | text       | null: false                     |
| category_id  | integer    | null: false                     |
| condition_id | integer    | null: false                     |
| fee_by_id    | integer    | null: false                     |
| from_id      | integer    | null: false                     |
| timeline_id  | integer    | null: false                     |
| price        | integer    | null: false                     |
| user         | references | null: false, foreign_key: true  |


### Association

- has_one :sale
- belongs_to :user

## sales テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- has_one :sale
- belongs_to :item
- belongs_to :user

## shipments テーブル

| Column       | Type       | Options                         |
| ------------ | ---------- | ------------------------------- |
| postal       | string     | null: false                     |
| from_id      | integer    | null: false                     |
| city         | string     | null: false                     |
| street       | string     | null: false                     |
| bldg         | string     | null: true                      |
| tel          | string     | null: false                     |
| sale         | references | null: false, foreign_key: true  |

### Association

- belongs_to :sale