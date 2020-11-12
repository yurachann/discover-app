class Genre < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
    { id: 1, name: 'アクション' },
    { id: 2, name: 'シューティング' },
    { id: 3, name: 'シュミレーション' },
    { id: 4, name: 'レーシング' },
    { id: 5, name: 'アドベンチャー' },
    { id: 6, name: 'RPG' },
    { id: 7, name: 'パズル' },
    { id: 8, name: 'カード' },
    { id: 9, name: '音楽' },
    { id: 10, name: 'その他' }
  ]

  has_many :game_ganres
  has_many :games, through: :game_ganres
  # def games
  #   game_ganres.map(&:game)
  # end
end
