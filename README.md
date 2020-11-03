# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_reading | string | null: false |
| last_name_reading  | string | null: false |
| birthday           | date   | null: false |

has_many :orders
has_many :items

# items テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| product      | string     | null: false |
| description  | text       | null: false |
| category     | string     | null: false |
| status       | string     | null: false |
| burden       | string     | null: false |
| deliveryarea | string     | null: false |
| deliverydays | string     | null: false |
| user         | references |             |

belongs_to :user
has_one :oder


# orders テーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| user      | references |             |
| item      | references |             |

has_one :address
belongs_to : item
belongs_to : user


# addresses テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| post_code    | string     | null: false |
| prefecture   | string     | null: false |
| city         | string     | null: false |
| house_number | string     | null: false |
| building_name| string     | null: false |
| phone_number | string     | null: false |
| user         | references |             |

belongs_to : order
