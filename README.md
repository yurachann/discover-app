# アプリ名
discover-app

# アプリケーション概要
ゲームレビューの投稿閲覧を行うアプリ
自分の付けた評価に似た評価を付けた人や似たジャンルが好きな人のレビューを見付けより自分に合ったゲームを見つける。

# URL

# テスト用アカウント

# 利用方法
ゲームソフトに紐付けられたレビューを見る。
ユーザー登録後、したことのあるゲームのレビューを書くことでその評価に近い評価をしたユーザーを見つけることができる。

# 目指した課題解決
・現状ゲームの評価は不特定多数の総合によってなされている.
これでは自分に適してないレビューも含まれるため実際の自分の評価とずれることがあった。
・自分の付けた評価に似た評価を付けた人や似たジャンルが好きな人のレビューを見られればより自分に合ったゲームを見つけられるのではないかと考えた。


# 洗い出した要件
・ゲームレビュー機能
・uesr管理機能
・ゲームのジャンル分
・お気に入り機能
・ゲーム一覧詳細表示機能

# 実装した機能についてのGIFと説明
・uesr管理機能
予想される評価項目に点数を付けられることと詳細なコメント、初心者向けか玄人向けかの判別する。
・ゲームのジャンル分
ソフトのデータ保存時にそのジャンルとコンソールを紐づける。

# 実装予定の機能
・お気に入り機能
・ゲーム一覧詳細表示機能
・ゲームレビュー機能

# データベース設計

# ローカルでの動作方法

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :relationships
- has_many :followings, through: :relationships, source: :follow
- has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
- has_many :followers, through: :reverse_of_relationships, source: :user
- has_many :reviews


## relationships テーブル

| Column    | Type       | Options                                        |
| --------- | ---------- | ---------------------------------------------- |
| user      | references | null: false, foreign_key: true                 |
| follow    | references | null: false, foreign_key: { to_table: :users } |

### Association

- has_many :relationships
- has_many :followings, through: :relationships, source: :follow
- has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
- has_many :followers, through: :reverse_of_relationships, source: :user
- has_many :reviews



## games テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false,                   |
| explain    | text       | null: false,                   |
| price      | integer    | null: false,                   |
| (image)    |            | null: false,                   |
| (movie)    |            | null: false,                   |

### Association

- has_many :game_genres
- has_many :genres, through: games_genres
- has_many :game_consoles
- has_many :consoles, through: games_consoles
- has_many :reviews



## genres テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| action_id     | integer    | null: false,                   |
| shooting_id   | integer    | null: false,                   |
| simulation_id | integer    | null: false,                   |
| racing_id     | integer    | null: false,                   |
| adventure_id  | integer    | null: false,                   |
| rpg_id        | integer    | null: false,                   |
| puzzle_id     | integer    | null: false,                   |
| card_id       | integer    | null: false,                   |
| music_id      | integer    | null: false,                   |

### Association

- has_many :game_genres
- has_many :games, through: games_genres


## game_genres テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| game          | references | null: false, foreign_key: true |
| genre         | references | null: false, foreign_key: true |

### Association

- belong_to :games
- belong_to :genres


## consoles テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| mobile_id     | integer    | null: false,                   |
| pc_id         | integer    | null: false,                   |
| switch_id     | integer    | null: false,                   |
| ps4_id        | integer    | null: false,                   |
| ps3_id        | integer    | null: false,                   |

### Association

- has_many :game_consoles
- has_many :games, through: games_consoles


## game_genres テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| game          | references | null: false, foreign_key: true |
| console       | references | null: false, foreign_key: true |

### Association

- belong_to :games
- belong_to :consoles


## review テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| score         | integer    | null: false,                   |
| graphic       | integer    | null: false,                   |
| sound         | integer    | null: false,                   |
| usability     | integer    | null: false,                   |
| explain       | text       | null: false,                   |
| beginner_reco | boolean    | null: false,                   |
| expert_reco   | boolean    | null: false,                   |
| user          | references | null: false, foreign_key: true |
| game          | references | null: false, foreign_key: true |

### Association

- belong_to :game
- belong_to :user
- has_many :comments

## comments テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| content       | text       | null: false,                   |
| user          | references | null: false, foreign_key: true |
| review        | references | null: false, foreign_key: true |

### Association

- belong_to :user
- belong_to :review
