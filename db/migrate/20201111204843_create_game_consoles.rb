class CreateGameConsoles < ActiveRecord::Migration[6.0]
  def change
    create_table :game_consoles do |t|
      t.references :game, foreign_key: true
      t.references :console, foreign_key: true
      t.timestamps
    end
  end
end
