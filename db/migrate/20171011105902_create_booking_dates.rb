class CreateBookingDates < ActiveRecord::Migration[5.1]
  def change
    create_table :booking_dates do |t|
      t.integer :booking_id
      t.integer :car_id
      t.date :booking_dates

      t.timestamps
    end
  end
end
