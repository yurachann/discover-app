class GameForm
  include ActiveModel::Model
  attr_accessor :image, :title, :explain, :price , :genre_ids, :console_ids

  with_options presence: true do
    validates :image
    validates :title
    validates :explain
    validates :price,      numericality: { only_integer: true }
    validates :genre_ids
    validates :console_ids
  end

  def save
    binding.pry
    Game.create(title: title, explain: explain, price: price, genre_ids: [], console_ids: [])
  end

end