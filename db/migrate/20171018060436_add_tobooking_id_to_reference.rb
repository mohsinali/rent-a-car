class AddTobookingIdToReference < ActiveRecord::Migration[5.1]
  def change
    add_column :references , :booking_id ,:integer
  end
end
