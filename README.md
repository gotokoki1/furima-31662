# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false | 
| first_name_kana    | string | null: false |
| birthday           | date   | null: false | 

### Association

- has_many :item_users
- has_many :items
- has_many :comments

## delivery_addresses テーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| post_code          | string     | null: false                    |
| prefecture_code_id | integer    | null: false                    |
| city               | string     | null: false                    |
| house_number       | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| item_users         | references | null: false, foreign_key: true |


### Association

- has_one :item_user

## items テーブル

| Column         | Type       | Option                         |
| -------------- | ---------- | ------------------------------ |
| name           | string     | null: false                    |
| price          | integer    | null: false                    |
| explanation    | text       | null: false                    |
| condition_id   | integer    | null: false                    |  
| postage_id     | integer    | null: false                    |
| prefecture_id  | integer    | null: false                    |
| prepare_day_id | integer    | null: false                    |
| category_id    | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- has_one :item_user
- belongs_to :user
- has_many :comments

## item_users テーブル

| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs :item
- belongs :user
- has_one :delivery_address

## comments テーブル

| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user