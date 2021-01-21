class ChangeDateToDateTimeInBookings < ActiveRecord::Migration[6.0]
  def change
    change_column :bookings, :date_end, :datetime
    change_column :bookings, :date_begin, :datetime
  end
end
