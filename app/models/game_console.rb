class GameConsole < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :games
  belongs_to_active_hash :console
end
