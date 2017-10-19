class RemoveBookingIdFromCustomer < ActiveRecord::Migration[5.1]
 def up
    remove_column :customers, :booking_id
  end

  def down
    add_column :customers, :booking_id, :integer
  end
end
