## items

| Colum             |Type       |Options                          |
| name              | string    | null: false                     |
| price             | integer   | null: false                     |
| description       | text      | null: false                     |
| condition_id      | integer   | null: false, foreign_key: :true |
| category_id       | integer   | null: false, foreign_key: :true |
| shipping_area_id  | integer   | null: false, foreign_key: :true |
| postage_type_id   | integer   | null: false, foreign_key: :true |
| preparation_day_id| integer   | null: false, foreign_key: :true |
| user              | references| null: false, foreign_key: :true |
| image             | string    | null: false, foreign_key: :true |


### Association
has_many :comments, dependent: :destroy
has_many :images, dependent: :destroy
has_one :purchase_management
belongs_to :user



## comments

|Column      |Type       |Options                        |
|user        |references |null: false, foreign_key: :true|
|item        |references |null: false, foreign_key: :true|
|comment     |text       |null: false                    |

### Association
belongs_to :user
belongs_to :item



## users

|Column            |Type  |Options                               |
|nickname          |string|null: false                           |
|encrypted_password|string|null: false                           |
|email             |string|null: false, unique: true, index: true|
|first_name        |string|null: false                           |
|first_name_kana   |string|null: false                           |
|last_name         |string|null: false                           |
|last_name_kana    |string|null: false                           |
|birth_day         |date  |null: false                           |

### Association
has_many :comments, dependent: :destroy
has_many :purchase_managements, dependent: :destroy
has_many :items, dependent: :destroy




## purchase_managements

|Column |Type      |Options                         |
|user|references|null :false, foreign_key: :true |
|item|references|null :false, foreign_key: :true |

### Association
belongs_to :user
belongs_to :item
has_one :address


## addresses

|Column             |Type      |Options                        |
|postal_code        |string    |null :false                    |
|prefectures_code_id|integer   |null :false                    |
|municipality_code  |string    |null :false                    |
|address            |text      |null :false, foreign_key: :true|
|building_code      |string    |
|phone_number       |string    |null :false                    |
|user               |references|null :false, foreign_key: :true|

### Association
belongs_to :purchase_management

