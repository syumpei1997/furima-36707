# README

<!-- usersテーブル   -->

| Column             | Type   | Options     |
|--------------------|--------|-------------|
| nickname           | string | null: false |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false |
| furigana_name      | string | null: false |
| furigana_last_name | string | null: false |
| name               | string | null: false |
| last_name          | string | null: false |
| birthday           | date | null: false |


### Association

- has_many :image_informations
- has_many :purchases

<!-- image_informationsテーブル   -->

| Column             | Type   | Options     |
|--------------------|--------|-------------|
| image_name         | string | null: false |
| image_explanation  | text   | null: false |
| category           | integer | null: false,dafault"11" |
| status             | integer | null: false,dafault"7"  |
| delivery           | integer | null: false,dafault"3"  |
| area               | integer | null: false,dafault"47" |
| nissuu             | integer | null: false,dafault"4"  |
| price              | integer| null: false |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase

<!-- purchasesテーブル   -->

| Column             | Type   | Options     |
|--------------------|--------|-------------|
| user               | references | null: false, foreign_key: true |
| image_information  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :image_information
- has_one    :shipping

<!-- shippingsテーブル   -->

| Column             | Type   | Options     |
|--------------------|--------|-------------|
| postal             | string | null: false |
| prefectures_id     | integer | null: false ,dafault"47"|
| municipality       | string | null: false |
| address            | string | null: false |
| building           | string |
| phone              | string | null: false |
| purchase           | references | null: false, foreign_key: true |


### Association

- belongs_to :purchase