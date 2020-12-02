## items

| Colum          |Type        |Options                          |
| name           | string     | null: false                     |
| price          | integer    | null: false                     |
| size           | references | null: false, foreign_key: :true |
| item_condition | references | null: false, foreign_key: :true |
| category       | references | null: false, foreign_key: :true |
| shipping_area  | references | null: false, foreign_key: :true |
| postage_type   | references | null: false, foreign_key: :true |
| postage_payer  | references | null: false, foreign_key: :true |
| preparation_day| references | null: false, foreign_key: :true |
| seller         | references | null: false, foreign_key: :true |


### Association
has_many :comments, dependent: :destroy
berongs_to_active_hash :size
berongs_to_active_hash :postage_type
berongs_to_active_hash :item_condition
berongs_to_active_hash :postage_payer
berongs_to_active_hash :category
berongs_to_active_hash :preparation_day
berongs_to :seller, class_name: "User"


## description_items

|Column|Type   |Options     |
|text  |integer|null :false |
|item  |integer|null :false |

### Association
berongs_to :items, dependent: :destroy



## comments

|Column      |Type       |Options                        |
|user        |references |null: false, foreign_key: :true|
|item        |references |null: false, foreign_key: :true|
|comment     |text       |null: false                    |
|created_at  |timestamp  |null: false                    |

### Association
berongs_to :user
berongs_to :item



## users

|Column         |Type  |Options                               |
|nickname       |string|null: false                           |
|password       |string|null: false                           |
|email          |string|null: false, unique: true, index: true|
|first_name     |string|null: false                           |
|first_name_kana|string|null: false                           |
|last_name      |string|null: false                           |
|last_name_kana |string|null: false                           |
|birth_day      |date  |null: false                           |

### Association
has_many :comments, dependent: :destroy
has_many :seller_items, foreign_key: "seller_id", class_name: "items"
has_many :buyer_items, foreign_key: "buyer_id", class_name: "items"
has_one :address, dependent: :destroy
has_one :sending_destination, dependent: :destroy



## addresses

|Column         |Type      |Options                        |
|first_name     |string    |null: false                    |
|first_name_kana|string    |null: false                    |
|last_name      |string    |null: false                    |
|last_name_kana |string    |null: false                    |
|nickname       |string    |null: false                    |
|password       |string    |null: false                    |
|shipping_area  |references|null: false, foreign_key: :true|

### Association
berongs_to :user



## purchase_managements

|Column|Type   |Options     |
|user  |integer|null :false |
|item  |integer|null :false |
|buyer |string |null :false |

### Association
berongs_to :user
has_many :items


