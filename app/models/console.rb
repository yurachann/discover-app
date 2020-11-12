class Console < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
    { id: 1, name: '携帯' },
    { id: 2, name: 'PC' },
    { id: 3, name: 'switch' },
    { id: 4, name: 'PS4' },
    { id: 5, name: 'PS3' }
  ]

  has_many :game_consoles
  has_many :games, through: :game_consoles
  # def games
  #   game_consoles.map(&:game)
  # end
end

