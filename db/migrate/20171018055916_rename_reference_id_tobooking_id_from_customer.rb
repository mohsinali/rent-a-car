class RenameReferenceIdTobookingIdFromCustomer < ActiveRecord::Migration[5.1]
 def up
    rename_column :customers, :reference_id ,:booking_id
  end

  def down
    add_column :customers, :reference_id
  end
end
