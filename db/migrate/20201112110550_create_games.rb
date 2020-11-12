class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string  :title,   null: false
      t.string  :explain, null: false
      t.integer :explain, null: false
      t.timestamps
    end
  end
end
