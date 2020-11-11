class Console < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '携帯' },
    { id: 3, name: 'PC' },
    { id: 4, name: 'switch' },
    { id: 5, name: 'PS4' },
    { id: 6, name: 'PS3' }
  ]

  has_many :game_consoles
  has_many :games, through: :game_consoles
end
