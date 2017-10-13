class ChangeColumeName < ActiveRecord::Migration[5.1]
  def self.up
    rename_column :bookings, :booking_datetime, :from_booking
  end

  def self.down
    # rename back if you need or do something else or do nothing
  end
end
