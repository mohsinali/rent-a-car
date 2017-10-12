class AddColumnCarVersionId < ActiveRecord::Migration[5.1]
  def change
    add_column :cars, :car_version_id, :integer
  end
end
