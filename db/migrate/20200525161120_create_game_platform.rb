class CreateGamePlatform < ActiveRecord::Migration[6.0]
  def change
    create_table :game_platforms do |t|
      t.references :games, null: false, foreign_key: true
      t.references :platforms, null: false, foreign_key: true
    end
  end
end
