class CreateTableOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.references :user, null: false, foreign_key: true
      t.string :address
      t.integer :area
      t.integer :price_per_hour
      t.string :title
      t.string :description
      t.string :photos
      t.timestamps
    end
  end
end
