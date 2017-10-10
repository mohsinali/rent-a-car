class AddColumnDetailsToCars < ActiveRecord::Migration[5.1]
  def change
    add_column :cars, :details, :text
  end
end
