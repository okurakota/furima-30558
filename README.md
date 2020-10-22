# テーブル設計

## usersテーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birth_day        | date   | null: false |

### Association
- has_many :product
- has_many :purchase


## productsテーブル

| Column           | Type          | Options     |
| ---------------- | ------------- | ----------- |
| product_name     | string        | null: false |
| description      | text          | null: false |
| category_id      | integer       | null: false |
| status_id        | integer       | null: false |
| shopping_cost_id | integer       | null: false |
| prefecture_id    | integer       | null: false |
| shopping_days_id | integer       | null: false |
| price            | integer       | null: false |
| user             | references    | null: false, foreign_key: true|

### Association
- has_one_attached :user
- has_one_attached :purchase


## addressテーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| postal_code_id  | string     | null: false |
| prefectures_id  | string     | null: false |
| municipalities  | string     | null: false |
| address         | string     | null: false |
| building_name   | string     |             |
| phone_number    | string     | null: false |

### Association
- belongs_to :purchase


## purchaseテーブル

| Column   | Type       | Options                       |
| -------- | ---------- | ----------------------------- |
| user     | references | null: false, foreign_key: true|
| products | references | null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product
- has_one_attached :address
