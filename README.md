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
- has_many :items, through: item_users
- has_many :comments
- has_one :delivery_address

## delivery_addresses テーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| post_code          | integer    | null: false                    |
| prefecture_code_id | integer    | null: false                    |
| city               | string     | null: false                    |
| house_number       | string     | null: false                    |
| building_name      | string     | null: false                    |
| phone_number       | integer    | unique: true                   |
| user               | references | null: false, foreign_key: true |

### Association

- has_one :user

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
| category_id    | references | null: false                    |
| seller         | references | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- has_many :item_users
- has_many :users, through: item_users
- has_many :categories
- has_many :comments

## item_users テーブル

| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## categories テーブル

| Column | Type   | Option      |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- belongs_to :item

## comments テーブル

| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user