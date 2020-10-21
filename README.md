# テーブル設計

## usersテーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| family_name      | string  | null: false |
| first_name       | string  | null: false |
| family_name_kana | string  | null: false |
| first_name_kana  | string  | null: false |
| birth_day        | integer | null: false |

## productsテーブル

| Column        | Type          | Options     |
| ------------- | ------------- | ----------- |
| image         | ActiveStorage | null: false |
| product_name  | string        | null: false |
| description   | text          | null: false |
| category      | string        | null: false |
| status        | string        | null: false |
| shopping_cost | integer       | null: false |
| prefecture    | string        | null: false |
| shopping_days | integer       | null: false |
| price         | integer       | null: false |
| user          | integer       | null: false, foreign_key: true|

## purchaseテーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| card_number     | integer | null: false |
| expiration_date | integer | null: false |
| security_code   | integer | null: false |
| postal_code     | integer | null: false |
| prefectures     | string  | null: false |
| municipalities  | string  | null: false |
| address         | string  | null: false |
| building_name   | string  |             |
| phone_number    | integer | null: false |
| product         | integer | null: false, foreign_key: true|
| user            | integer | null: false, foreign_key: true|
