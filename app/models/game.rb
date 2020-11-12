class Game < ApplicationRecord
  
  has_one_attached :image
  has_many :reviews

  has_many :game_genres
  has_many :genres, through: :game_genres
  # def genres
  #   game_genres.map(&:genre)
  # end
  has_many :game_consoles
  has_many :consoles, through: :game_consoles
  # def consoles
  #   game_consoles.map(&:console)
  # end
end
