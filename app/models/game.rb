class Game < ApplicationRecord
  validates :title, :catch_copy, :image, presence: true

  has_one_attached :image
  has_many :reviews

  has_many :game_genres
  def genres
    game_genres.map(&:genre)
  end
  has_many :game_consoles
  def consoles
    game_consoles.map(&:console)
  end
end
