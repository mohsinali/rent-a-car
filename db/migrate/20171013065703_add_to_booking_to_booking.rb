class AddToBookingToBooking < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :to_booking, :datetime
  end
end
