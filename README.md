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
| catch_copy | string     | null: false,                   |
| (image)    |            | null: false,                   |
| (movie)    |            | null: false,                   |

### Association

- belongs_to :user
- belongs_to :follow, class_name: 'User'

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
