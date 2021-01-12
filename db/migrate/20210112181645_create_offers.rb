class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.references :user, foreign_key: { to_table: :offers }
      t.string :address
      t.integer :area
      t.integer :price_per_hour
      t.string :title
      t.string :description
      t.string :photos
    end
  end
end
