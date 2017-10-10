class AddColumnsMakeIdAndCarModelIdToCars < ActiveRecord::Migration[5.1]
  def change
    add_column :cars, :make_id, :integer
    add_column :cars, :car_model_id, :integer
  end
end
