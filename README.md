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
- has_many :products
- has_many :purchases


## productsテーブル

| Column           | Type          | Options     |
| ---------------- | ------------- | ----------- |
| name             | string        | null: false |
| description      | text          | null: false |
| category_id      | integer       | null: false |
| status_id        | integer       | null: false |
| shopping_cost_id | integer       | null: false |
| prefecture_id    | integer       | null: false |
| shopping_day_id  | integer       | null: false |
| price            | integer       | null: false |
| user             | references    | null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :purchase


## addressテーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| postal_code     | string     | null: false |
| prefectures_id  | integer    | null: false |
| municipalities  | string     | null: false |
| address         | string     | null: false |
| building_name   | string     |             |
| phone_number    | string     | null: false |
| purchase        | references | null: false, foreign_key: true|

### Association
- belongs_to :purchase


## purchaseテーブル

| Column   | Type       | Options                       |
| -------- | ---------- | ----------------------------- |
| user     | references | null: false, foreign_key: true|
| product  | references | null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product
- has_one :address
