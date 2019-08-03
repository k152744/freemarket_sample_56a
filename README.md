# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Shipping_origin テーブル
|Column|Type|Options|
|------|----|-------|
|name|text|null: false, unique: true|
### Association
- has_many :user_informations
- has_many :products

## User テーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|family_name_kanji|text|null: false|
|first_name_kanji|text|null: false|
|family_name_kana|text|null: false|
|first_name_kana|text|null: false|
|birthday|date|null: false|
|telephone_number|bigint|null: false|
|comment|string|null: false|
### Association
- has_many :products
- has_many :favorites
- has_many :comments
- has_many :evaluations
- has_many :points
- has_many :traiding_comment
- has_many :fav_products, through: :favorites, source: :products
- has_one :user_information
- has_one :user_card

## User_information テーブル
|Column|Type|Options|
|------|----|-------|
|family_name_kanji|text|null: false|
|first_name_kanji|text|null: false|
|family_name_kana|text|null: false|
|first_name_kana|text|null: false|
|post_number|integer|null: false|
|shipping_origin|reference|foreign_key: true|
|village|text|null: false|
|address|string|null: false|
|building_name|string|null: false|
|phone_number|bigint|null: false|
|user|reference|foreign_key: true|
### Association
- belongs_to :user
- belongs_to :shipping_origin

## User_card テーブル
|Column|Type|Options|
|------|----|-------|
|user|reference|foreign_key: true|
### Association
- belongs_to :user


## Product テーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|detail|string|null: false|
|brand|reference|foreign_key: true|
|price|integer|null: false|
|user|reference|foreign_key: true|
|big_category|reference|foreign_key: true|
|middle_category|reference|foreign_key: true|
|small_category|reference|foreign_key: true|
|status|reference|foreign_key: true|
|delivary_fee|reference|foreign_key: true|
|delivary_way|reference|foreign_key: true|
|Shipping_origin|reference|foreign_key: true|
|buyer|integer|----------|
|listing_status|boolean|default:true|
### Association
- has_many :favorites
- has_many :comments
- has_many :users, through: :favorites
- has_many :product_images
- has_one :trading_history
- belongs_to :shipping_origin
- belongs_to :user
- belongs_to :big_category
- belongs_to :middle_category
- belongs_to :small_category
- belongs_to :brand
- belongs_to :status
- belongs_to :delivary_fee
- belongs_to :delivary_way
- belongs_to :delivary_day
- belongs_to :shipping_origin


## Product_image テーブル
|Column|Type|Options|
|------|----|-------|
|product|reference|foreign_key: true|
### Association
belongs_to :product

<!-- カテゴリー -->

## Big_category テーブル
|Column|Type|Options|
|------|----|-------|
|name|text|null: false|
### Association
- has_many :middle_categories
- has_many :products

## Middle_category テーブル
|Column|Type|Options|
|------|----|-------|
|name|text|null: false|
|big_category|reference|foreign_key: true|
### Association
- has_many :products
- has_many :small_categories
- belongs_to :big_category

## Small_category テーブル
|Column|Type|Options|
|------|----|-------|
|name|text|null: false|
|middle_category|reference|foreign_key: true|
### Association
- has_many :products
- belongs_to :middle_category

## Brand テーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :products

## Status テーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
### Association
- has_many :products

<!-- 配送情報 -->

## Delivary_fee テーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
### Association
- has_many :products

## Delivary_way テーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
### Association
- has_many :products

## Delivary_day テーブル
|Column|Type|Options|
|------|----|-------|
|day|string|null: false|
### Association
- has_many :products

## Favorite テーブル
|Column|Type|Options|
|------|----|-------|
|user|reference|foreign_key: true|
|product|reference|foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product

## Comment テーブル
|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
|user|reference|foreign_key: true|
|product|reference|foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product

## Evaluation テーブル
|Column|Type|Options|
|------|----|-------|
|user|reference|foreign_key: true|
|status|string|null: false|
### Association
- belongs_to :user

## Point テーブル
|Column|Type|Options|
|------|----|-------|
|user|reference|foreign_key: true|
|value|integer|null: false|
### Association
- belongs_to :user

## Infomation テーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
### Association

## Traiding_history テーブル
|Column|Type|Options|
|------|----|-------|
|product|reference|foreign_key: true|
|delivary_status|string|null: false|
### Association
- belongs_to :product
- has_many :traiding_comments

## Traiding_comment テーブル
|Column|Type|Options|
|------|----|-------|
|trading_history|reference|foreign_key: true|
|user|reference|foreign_key: true|
|text|text|null: false|
### Association
- belongs_to :traiding_history
- belongs_to :user