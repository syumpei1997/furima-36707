# README

<!-- usersテーブル   -->

| Column             | Type   | Options     |
|--------------------|--------|-------------|
| nickname           | string | null: false |
| name               | string | null: false |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false |
| furigana_name      | string | null: false |
| furigana_last_name | string | null: false |
| last_name          | string | null: false |
| birthday           | integer | null: false |


### Association

- has_many :image_informations
- has_many :purchases

<!-- image_informationsテーブル   -->

| Column             | Type   | Options     |
|--------------------|--------|-------------|
| image_name         | text   | null: false |
| image_explanation  | text   | null: false |
| category           | integer | null: false |
| status             | integer | null: false |
| delivery           | integer | null: false |
| area               | integer | null: false |
| date               | integer | null: false |
| price              | integer| null: false |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one    :purchases

<!-- purchasesテーブル   -->

| Column             | Type   | Options     |
|--------------------|--------|-------------|
| user               | references | null: false, foreign_key: true |
| image_information  | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :image_informations
- has_one    :shippings

<!-- shippingsテーブル   -->

| Column             | Type   | Options     |
|--------------------|--------|-------------|
| postal             | string | null: false |
| municipality       | string | null: false |
| address            | string | null: false |
| building           | string |
| phone              | string | null: false |
| image_information  | references | null: false, foreign_key: true |


### Association

- belongs_to :purchases