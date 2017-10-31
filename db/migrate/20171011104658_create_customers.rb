class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :cnic
      t.string :phone
      t.text :address
      t.integer :reference_id, :default => nil
      t.string :email

      t.timestamps
    end
  end
end
