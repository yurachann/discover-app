class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string     :title,              null: false
      t.text       :explain,            null: false
      t.integer    :price,              null: false
      t.timestamps
    end
  end
end
