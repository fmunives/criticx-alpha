class AddParentIdToGame < ActiveRecord::Migration[6.0]
  def change
    add_reference :games, :parent, null: true
  end
end
