class CreateGameGenre < ActiveRecord::Migration[6.0]
  def change
    create_table :game_genres do |t|
      t.references :games, null: false, foreign_key: true
      t.references :genres, null: false, foreign_key: true
    end
  end
end
