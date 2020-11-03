# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_reading | string | null: false |
| last_name_reading  | string | null: false |
| birthday           | date   | null: false |

has_many :orders
has_many :items

# items テーブル

| Column          | Type       | Options                     |
| --------------- | ---------- | --------------------------- |
| product         | string     | null: false                 |
| description     | text       | null: false                 |
| category_id     | integer    | null: false,ActiveHash      |
| status_id       | integer    | null: false,ActiveHash      |
| burden_id       | integer    | null: false,ActiveHash      |
| area_id         | integer    | null: false,ActiveHash      |
| deliveryday_id  | integer    | null: false,ActiveHash      |
| user            | references | foreign_key:true            |
| price           | integer    | null: false                 |

belongs_to :user
has_one :order


# orders テーブル

| Column    | Type       | Options           |
| --------- | ---------- | ----------------- |
| user      | references | foreign_key:true  |
| item      | references | foreign_key:true  |

has_one :address
belongs_to : item
belongs_to : user


# addresses テーブル

| Column        | Type       | Options                     |
| ------------- | ---------- | --------------------------- |
| post_code     | string     | null: false                 |
| prefecture_id | integer    | null: false,ActiveHash      |
| city          | string     | null: false                 |
| house_number  | string     | null: false                 |
| building_name | string     |                             |
| phone_number  | string     | null: false                 |
| order         | references | foreign_key:true            |

belongs_to : order
