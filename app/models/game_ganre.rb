class GameGanre < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :game
  belongs_to_active_hash :genre
  
end
