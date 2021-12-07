# README

<!-- userテーブル   -->

| Column             | Type   | Options    |
|--------------------|--------|-------------|
| nickname           | string | null: false |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| furigana           | string | null: false |

### Association

- has_many :image informations
- has_many :purchase
- has_many :shipping

<!-- image informationテーブル   -->

| Column             | Type   | Options     |
|--------------------|--------|-------------|
| image              | string | null: false |
| image_name         | text   | null: false |
| image_explanation  | text   | null: false |
| category           | string | null: false |
| status             | string | null: false |
| delivery           | string | null: false |
| area               | string | null: false |
| days               | string | null: false |
| price              | integer| null: false |
| user               | references | null: false foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase
- has_one    :shipping

<!-- purchaseテーブル   -->

| Column             | Type   | Options     |
|--------------------|--------|-------------|
| credit             | integer| null: false |
| user               | references | null: false foreign_key: true |
| image information  | references | null: false foreign_key: true |

### Association

- belongs_to :user
- belongs_to :image information
- has_one    :shipping

<!-- shippingテーブル   -->

| Column             | Type   | Options     |
|--------------------|--------|-------------|
| postal             | string | null: false |
| prefectures        | string | null: false |
| municipality       | string | null: false |
| address            | string | null: false |
| building           | string | null: false |
| phone              | string | null: false |
| user               | references | null: false foreign_key: true |

### Association

- belongs_to :user
- belongs_to :image information
- belongs_to :purchase