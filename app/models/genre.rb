class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'アクション' },
    { id: 3, name: 'シューティング' },
    { id: 4, name: 'シュミレーション' },
    { id: 5, name: 'レーシング' },
    { id: 6, name: 'アドベンチャー' },
    { id: 7, name: 'RPG' },
    { id: 8, name: 'パズル' },
    { id: 9, name: 'カード' },
    { id: 10, name: '音楽' },
    { id: 11, name: 'その他' }
  ]

  has_many :game_ganres
  has_many :games, through: :game_ganres
end
