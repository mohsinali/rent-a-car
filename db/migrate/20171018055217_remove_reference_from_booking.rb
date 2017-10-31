class RemoveReferenceFromBooking < ActiveRecord::Migration[5.1]
 def up
    remove_column :bookings, :reference_id
  end

  def down
    add_column :bookings, :reference_id, :integer
  end
end
