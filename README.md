# README

* アプリケーション名 

  「Repos」

* アプリケーション概要

  自分の目的に合ったカフェを見つけることができる.

* URL

  https://repos-cf.herokuapp.com/

* テスト用アカウント

  BASIC認証
  
  ID: admin 
  PASS: 0613

  ログイン情報（テスト用）

  Email:  c-mail@gmail.com

  Password: repos71

  新規投稿Password: 1234


* 利用方法

  自分がカフェに求めるもの、もしくは地域別で調べることができる。店舗ごとのページには投稿者のおすすめポイントが書いてあるので、それを元に行ってみたい店舗の特定、そして利用後に噂に違わぬ店だったのか、など自由にコメントを残すこともできる。

* 目指した課題解決

  コーヒーを豆から挽いて飲む人と粉の状態にお湯を注いで飲むだけの人では求める味のクオリティに差があるのは当たり前です。ネットにある膨大な情報からその差を判別することは難しいことです。特定のユーザーのみ店舗の新規投稿をできるようにすることで、カフェに行ってがっかりすることを少なくするのが目的です。

* 要件定義
  ・ユーザー管理機能

  ・カフェ投稿機能

  ・検索機能

  ・カフェ詳細機能

  ・マイページ実装

  ・編集、削除機能

  ・絞り込み検索

  ・コメント機能

  ・いいね機能

  ・Google Maps API

* 実装した機能

  ・ユーザー管理機能

    https://gyazo.com/5803625f2f841e2fa8c8c38ac695abed

    ユーザー登録（ニックネーム、email,password必須 profileは任意）
  
    ログイン（email,password必須）、ログアウト機能


  ・カフェ投稿機能

    https://gyazo.com/269c9cbfc03efd2816193b9c96180be9

    画像、カフェ名、住所、おすすめポイントは必須、URLは任意、目的と地域はプルダウンで選択必須。

    ※投稿にはあらかじめ決めておいたパスワードが必須

  ・検索機能

  https://gyazo.com/6fd98ddc4142406c770cc802c73c7642

  目的と地域をそれぞれリンク付きで表記する。それぞれ個別のデータを持っているのでクリックするだけで検索ができる。

  ・カフェ詳細機能

  https://gyazo.com/568cc7aa8853dac23958727db301ab9a

  投稿機能で登録された内容の表示、投稿者の名前をクリックするとその人のマイページに飛ぶこともできる。本人のみ編集、削除可能

  ・マイページ実装

  https://gyazo.com/301441e24fb490d3ff984994b93d33fc

  ニックネーム、email,プロフィール欄、自分が投稿したカフェ情報の表示。本人の場合のみemail表示、本人のみ編集可能

  ・絞り込み検索

  https://gyazo.com/28c6f4d082d4f544a736924c0cb3f3eb

  https://gyazo.com/22fd44c53ee66c3d398243ca68b7f42b

  カフェ一覧ページにプルダウンを設置、目的からとんだら県名のプルダウン。地域からとんだら目的と地域内の県名のみのプルダウンでそれぞれ検索可能

* 実装予定の機能

  ・新規投稿やコメントするときに複数枚の写真を投稿できるようにして雰囲気が伝わりやすいようにします。

  ・いいね機能をつけることでお気に入りの店をマイページにいけばすぐに確認できるようにします。
  
  ・Google Maps APIを導入できればカフェまでの経路をわざわざ調べ直さなくてもよくなるので手間が省けます。

* 工夫した点
  
  一番伝えたい部分を大きな文字で目立つようにしてトップページに持ってきて訴えかけたこと。また雰囲気を統一しカフェの情報が伝わりやすいページにするために、トップページ以外はシンプルな作りにしています。


* 使用技術（開発環境）

  Ruby, Ruby on Rails, HTML, CSS


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
