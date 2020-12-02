## items

| Colum          |Type        |Options                          |
| name           | string     | null: false                     |
| price          | integer    |  null: false                    |
| item_condition | references | foreign_key: :true              |
| category       | references | null: false, foreign_key: :true |
| brand          | references | null: false, foreign_key: :true |
| postage_payer  | references | null: false, foreign: :true     |
| seller         | references | null: false, foreign: :true     |
| buyer          | references | null: false, foreign: :true     |


### Association
has_many :comments, dependent: :destroy
has_many :item_imgs, dependent: :destroy
berongs_to_active_hash :size
berongs_to_active_hash :postage_type
berongs_to_active_hash :item_condition
berongs_to_active_hash :postage_payer
berongs_to_active_hash :category
berongs_to :brand
berongs_to_active_hash :preparation_day
berongs_to :seller, class_name: "User"
berongs_to :buyer, class_name: "User"


## item_imgs

|Column|Type      |Options                        |
|item  |references|null: false, foreign_key: :true|


### Association
berongs_to :item


## sizes

|Column|Type  |Options    |
|size  |string|null: false|


### Association
has_many :items


## postage_types

|Column      |Type  |Options    |
|postage_type|string|null: false|


### Association
has_many :items



## item_conditions

|Column        |Type  |Options    |
|item_condition|string|null: false|


### Association
has_many :items


## postage_payer

|Column        |Type  |Options    |
|postage_payers|string|null: false|


### Association
has_many :items


## categorys

|Column|Type  |Options    |
|name  |string|null: false|


### Association
has_many :items

## brands

|Column|Type  |
|name  |string|


### Association
has_many :items

## preparation_days

|Column          |Type  |Options    |
|preparation_days|string|null: false|


### Association
has_many :items

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
|birth_year     |date  |null: false                           |
|birth_month    |date  |null: false                           |
|birth_day      |date  |null: false                           |

### Association
has_many :comments, dependent: :destroy
has_many :seller_items, foreign_key: "seller_id", class_name: "items"
has_many :buyer_items, foreign_key: "buyer_id", class_name: "items"
has_one :address, dependent: :destroy
has_one :credit_card, dependent: :destroy
has_one :sending_destination, dependent: :destroy

## addresses

|Column|Type|Options|
|first_name|string|null: false|
|first_name_kana|string|null: false|
|last_name|string|null: false|
|last_name_kana|string|null: false|
|nickname|string|null: false|
|password|string|null: false|
|prefecture_code|integer|null: false|

### Association
berongs_to :user

## sending_destinations

|Column         |Type   |Options                |
|post_code      |integer|null :false            |
|prefecture_code|integer|null :false            |
|city|string    |null :false                    |
|house_number   |string |null :false            |
|building_name  |string |
|phone_number   |integer|
|user|references|null :false, foreign_key: :true|

### Association
berongs_to :user

## credit_cards

|Column|Type|Options|
|card_number  |integer   |null: false, unique: true      |
|exp_month    |integer   |null: false                    |
|exp_year     |integer   |null: false                    |
|security_code|integer   |null: false                    |
|user         |references|null: false, foreign_key: :true|

### Association
berongs_to :user

