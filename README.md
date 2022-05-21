# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birth_date_year    | string | null: false |
| birth_date_mon     | string | null: false |
| birth_date_day     | string | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル
| Column             | Type       | Options                        |
| ------------------ | ------     | -----------                    |
| product            | string     | null: false                    |
| explain            | text       | null: false                    |
| category           | string     | null: false                    |
| state              | string     | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :purchase


## purchase テーブル
| Column            | Type       | Options                        |
| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :item
- has_one :deliveryinformation


## deliveryinformation テーブル
| Column             | Type       | Options                        |
| ------------------ | ------     | -----------                    |
| postal_code        | string     | null: false                    |
| prefecture         | string     | null: false                    |
| addresses          | string     | null: false                    |
| city               | string     | null: false                    |
| building           | string     | null: false                    |
| phone_number       | string     | null: false                    |
| purchase           | references | null: false, foreign_key: true |

### Association

- belong_to :purchase
