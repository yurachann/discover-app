class Game < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :title
    validates :explain
    validates :price,      numericality: { only_integer: true }
  end

  has_one_attached :image
end
