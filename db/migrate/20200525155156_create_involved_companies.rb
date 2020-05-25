class CreateInvolvedCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :involved_companies do |t|
      t.boolean :developer
      t.boolean :publisher
      t.references :companies, null: false, foreign_key: true
      t.references :games, null: false, foreign_key: true

      t.timestamps
    end
  end
end
