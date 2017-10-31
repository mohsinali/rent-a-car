class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.integer :car_id
      t.integer :customer_id
      t.float :booking_price
      t.integer :number_of_days, :default => 1
      t.datetime :booking_datetime
      t.float :advance_payment

      t.timestamps
    end
  end
end
