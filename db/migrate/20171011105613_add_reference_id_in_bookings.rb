class AddReferenceIdInBookings < ActiveRecord::Migration[5.1]
  def change
    
    add_column :bookings, :reference_id, :integer
  
  end
end
