class CreateGameConsoles < ActiveRecord::Migration[6.0]
  def change
    create_table :game_consoles do |t|
      t.references :game,       foreign_key: true
      t.integer    :console_id, null: false
      t.timestamps
    end
  end
end
