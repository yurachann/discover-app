class GameGanre < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belong_to :games
  belong_to_active_hash :genre

  validates :genre_id, numericality: { other_than: 1 }
end
