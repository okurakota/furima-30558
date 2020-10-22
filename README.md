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

| Column        | Type          | Options     |
| ------------- | ------------- | ----------- |
| image         | ActiveStorage | null: false |
| product_name  | string        | null: false |
| description   | text          | null: false |
| category      | integer       | null: false |
| status        | integer       | null: false |
| shopping_cost | integer       | null: false |
| prefecture    | integer       | null: false |
| shopping_days | integer       | null: false |
| price         | integer       | null: false |
| user          | references    | null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :purchase


## addressテーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| postal_code     | string     | null: false |
| prefectures     | string     | null: false |
| municipalities  | string     | null: false |
| address         | string     | null: false |
| building_name   | string     |             |
| phone_number    | string     | null: false |
| user            | references | null: false, foreign_key: true|
| product         | references | null: false, foreign_key: true|

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
- belongs_to :address
