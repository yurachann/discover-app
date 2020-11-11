class Game < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :title, :catch_copy, :image, presence: true

  has_one_attached :image
  has_many :reviews

  has_many :game_genres
  has_many_active_hash :genres, through: :games_genres
  has_many :game_consoles
  has_many_active_hash :consoles, through: :games_consoles
end
