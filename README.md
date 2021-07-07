# README

* アプリケーション名 

  「repos」

* アプリケーション概要

  自分の目的に合ったカフェを見つけることができる

* URL

  https://repos-cf.herokuapp.com/

* テスト用アカウント

* 利用方法

  自分がカフェに求めるもの、もしくは地域別で調べることができる。店舗ごとのページには投稿者のおすすめポイントが書いてあるので、それを元に行ってみたい店舗のGoogleマップで場所の特定もすぐにできる。

* 目指した課題解決

  コーヒーを豆から挽いて飲む人と粉の状態にお湯を注いで飲むだけの人では求める味のクオリティに差があるのは当たり前である。ネットにある膨大な情報からその差を判別することは難しい。特定のユーザーのみ店舗の新規投稿をできるようにすることで、カフェに行ってがっかりすることを少なくするのが目的。

* 要件定義

* 実装した機能

* 実装予定の機能

* データベース設計

## テーブル設計

## users テーブル

| Column     | Type       | Options                   |
| ---------- | ---------- | ------------------------- |
| nickname   | string     | null: false               |
| email      | string     | null: false, unique: true |
| password   | string     | null: false               |
| profile    | text       |                           |

### Association

- has_many :cafes
- has_many :comments
- has_many :likes


## cafes テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| address       | string     | null: false                    |
| URL           | string     |                                |
| recommend     | text       | null: false                    |
| purpose_id    | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_many :likes


## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| user_id | references | null: false, foreign_key: true |
| cafe_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :cafe


## likes テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| cafe_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :cafe