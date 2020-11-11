class GameConsole < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belong_to :games
  belong_to_active_hash :console

  validates :console_id, numericality: { other_than: 1 }
end
