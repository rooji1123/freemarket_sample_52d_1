
# README

## usersテーブル
|Column|Type|Options|
|------|-----|------|
|nickname|string|null:false|
|introduction|text||
|avatar_image|string||

has_many :points
has_many :comments
has_many :items
has_many :purchaseds

## user_informationsテーブル
|Column|Type|Options|
|------|-----|------|
|first_name|string|null:false|
|last_name|string|null:false|
|first_name_kana|string|null:false|
|last_name_kana|string|null:false|
|phone_number|integer|null:false|
|birthday|string|null:false|
|user|references|foreign_key: true, null:false|

belongs_to :user

## user_addressテーブル
|Column|Type|Options|
|------|-----|------|
|postal_code|integer|null:false|
|country|string|null:false|
|city|string|null:false|
|address|string|null:false|
|building_name|string||
|phone_number|integer||
|user|references|foreign_key: true, null:false|

belongs_to :user

## credit_cardsテーブル
|Column|Type|Options|
|------|-----|------|
|credit_number|integer|null:false|
|user|references|foreign_key: true, null:false|

belongs_to :user

## pointsテーブル
|Column|Type|Options|
|------|-----|------|
|user|references|foreign_key: true, null_false|
|point|integer||
|expiration_date|integer|null_false|

belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|-----|------|
|name|string|null_false|
|introduction|text|null_false|
|price|integer|null_false|
|brand|references|foreign_key: true, |

has_many :comments
belongs_to :user
belongs_to :brand

## overviewsテーブル（概要）
|Column|Type|Options|
|------|-----|------|
|item|references|foreign_key: true, null:false|

belongs_to :items
has_many :images


## imagesテーブル
|Column|Type|Options|
|------|-----|------|
|image|text||
|overview|references|foreign_key: true, null:false|

belongs_to :images

## detailsテーブル（詳細）
|Column|Type|Options|
|------|-----|------|
|item|references|foreign_key: true, null:false|
|category|references|foreign_key: true, null:false|

belongs_to :item
belongs_to :category

## categorysテーブル
|Column|Type|Options|
|------|-----|------|
|name|string|null:false|
|size|string||
|ancestry|string|null:false|

has_many :details
has_ancestry

## deliveriesテーブル
|Column|Type|Options|
|------|-----|------|
|burden|string|null:false|
|method|string|null:false|
|region|string|null:false|
|day|string|null:false|
|item|references|foreign_key: true, null:false|

## commentsテーブル
|Column|Type|Options|
|------|-----|------|
|comment|text|null:false|
|user|references|foreign_key: true, null:false|
|item|references|foreign_key: true, null:false|

belongs_to :user
belongs_to :item

## purchaseds (購入済みテーブル)
|Column|Type|Options|
|------|-----|------|
|item|references|foreign_key: true, null:false|
|seller_id|references|foreign_key: true, null:false|
|buyer_id|references|foreign_key: true, null:false|

has_many :messages
belongs_to :user
belongs_to :item

## messagesテーブル (購入した後の連絡用)
|Column|Type|Options|
|------|-----|------|
|message|text|null:false|
|purchased|references|foreign_key: true, null:false|

belongs_to :purchaseds

## brandsテーブル
|Column|Type|Options|
|------|-----|------|
|name|string|null:false|

has_many :brand_module
has_many :brand_categorys, through: :brand_module
has_many :items

## brand_categorysテーブル
|Column|Type|Options|
|------|-----|------|
|name|string|null:false|

has_many :brand_categorys
has_many :brands, through: :brand_categorys

## brand_moduleテーブル(中間)
|Column|Type|Options|
|------|-----|------|
|brand|references|foreign_key: true, null:false|
|brand_category|references|foreign_key: true, null:false|

belongs_to :brands
belongs_to :brand_categrys





