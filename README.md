
# README

## usersテーブル
|Column|Type|Options|
|------|-----|------|
|nickname|string|null:false|
|introduction|text||
|avatar_image|string||
|user_information_id|integer|null:false|
|user_address_id|integer|null_false|
|credit_card_id|integer|null_false|

has_many :points
has_many :comments
has_many :products

## user_informationsテーブル
|Column|Type|Options|
|------|-----|------|
|first_name|string|null:false|
|last_name|string|null:false|
|first_name_kana|string|null:false|
|last_name_kana|string|null:false|
|phone_number|integer|null:false|
|birthday|string|null:false|
|user_id|integer|null:false|

belongs_to :user

## user_addressテーブル
|Column|Type|Options|
|------|-----|------|
|postal_code|integer|null:false|
|country|string|null:false|
|city|string|null:false|
|address|string|null:false|
|building_name1|string||
|building_name2|string||
|phone_number|integer||
|user_id|integer|null:false|

belongs_to :user

## credit_cardsテーブル
|Column|Type|Options|
|------|-----|------|
|credit_number|integer|null:false|
|user_id|integer|null:false|

belongs_to :user

## pointsテーブル
|Column|Type|Options|
|------|-----|------|
|user_id|integer|null_false|
|point|integer||
|expiration_date|integer|null_false|

belongs_to :user

## productsテーブル
|Column|Type|Options|
|------|-----|------|
|name|string|null_false|
|introduction|text|null_false|
|price|integer|null_false|
|brand_id|integer||

has_many :comments
belongs_to :user
belongs_to :brand

## overviewsテーブル（概要）
|Column|Type|Options|
|------|-----|------|
|product_id|integer|null:false|

belongs_to :products
has_many :images


## imagesテーブル
|Column|Type|Options|
|------|-----|------|
|image|text||
|overview_id|integer|null:false|

belongs_to :images

## detailsテーブル（詳細）
|Column|Type|Options|
|------|-----|------|
|products_id|integer|null:false|
|category_id|integer|null:false|

belongs_to :products
belongs_to :catagorie

## categoriesテーブル
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
|delivery_burden_id|integer|null:false|
|delivery_method_id|integer|null:false|
|delivery_region|integer|null:false|
|delivery_day|integer|null:false|

belongs_to :delivery_burden
belongs_to :delivery_method
belongs_to :delivery_region
belongs_to :delivery_day



## delivery_burdensテーブル (負担)
|Column|Type|Options|
|------|-----|------|
|burden|string|null:false|

has_many :deliveries

## delivery_methodsテーブル (方法)
|Column|Type|Options|
|------|-----|------|
|method|string|null:false|

has_many :deliveries

## delivery_regionテーブル (地域)
|Column|Type|Options|
|------|-----|------|
|country|string|null:false|

has_many :deliveries

## delivery_to_days
|Column|Type|Options|
|------|-----|------|
|day|string|null:false|

has_many :deliveries


## commentsテーブル
|Column|Type|Options|
|------|-----|------|
|comment|text|null:false|
|user_id|text|null:false|
|product_id|integer|null:false|

belongs_to :user
belongs_to :product

## purchaseds (購入済みテーブル)
|Column|Type|Options|
|------|-----|------|
|product_id|integer|null:false|
|seller_id|integer|null:false|
|buyer_id|integer|null:false|

has_many :messages

## messagesテーブル (購入した後の連絡用)
|Column|Type|Options|
|------|-----|------|
|message|text|null:false|
|purchased_id|integer|null:false|

belongs_to :purchaseds

## brandsテーブル
|Column|Type|Options|
|------|-----|------|
|name|string|null:false|

has_many :中間テーブル
has_many :brand_categorys, through: :中間テーブル
has_many_to :products

## brand_categorysテーブル
|Column|Type|Options|
|------|-----|------|
|name|string|null:false|

has_many :中間テーブル
has_many :brands, through: :中間テーブル
belongs_to :products

## 中間テーブル
|Column|Type|Options|
|------|-----|------|
|brand_id|integer||
|brand_category_id|integer||

belongs_to :brands
belongs_to :brand_categrys





