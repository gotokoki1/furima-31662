# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false | 
| first_name_kana | string | null: false |
| birthday        | date   | null: false | 

### Association

- has_many :items
- has_many :comments
- has_one :credit_card
- has_one :delivery_address

## credit_cards テーブル

| Column          | Type       | Option                         |
| --------------- | ---------- | ------------------------------ |
| card_id         | string     | null: false                    |
| expiration_date | string     | null: false                    |
| customer_id     | string     | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- has_one :user

## delivery_addresses テーブル

| Column          | Type       | Option                         |
| --------------- | ---------- | ------------------------------ |
| post_code       | integer    | null: false                    |
| prefecture_code | integer    | null: false                    |
| city            | string     | null: false                    |
| house_number    | string     | null: false                    |
| building_name   | string     | null: false                    |
| phone_number    | integer    | unique: true                   |
| user            | references | null: false, foreign_key: true |

### Association

- has_one :user

## items テーブル

| Column      | Type       | Option                         |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| price       | integer    | null: false                    |
| explanation | text       | null: false                    |
| condition   | integer    | null: false                    |  
| postage     | integer    | null: false                    |
| prefecture  | integer    | null: false                    |
| prepare_day | integer    | null: false                    |
| category    | references | null: false                    |
| seller      | references | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :item_images
- has_many :categories
- has_many :comments

## item_images テーブル

| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| image  | text       | null: false                    |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :item

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