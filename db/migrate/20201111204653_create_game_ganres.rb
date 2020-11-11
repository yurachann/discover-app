class CreateGameGanres < ActiveRecord::Migration[6.0]
  def change
    create_table :game_ganres do |t|
      t.references :game, foreign_key: true
      t.references :ganre, foreign_key: true
      t.timestamps
    end
  end
end
