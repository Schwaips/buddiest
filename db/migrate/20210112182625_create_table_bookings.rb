class CreateTableBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :offer, null: false, foreign_key: true
      t.date :date_begin
      t.date :date_end
      t.integer :price_total
      t.string :status
      t.timestamps
    end
  end
end
