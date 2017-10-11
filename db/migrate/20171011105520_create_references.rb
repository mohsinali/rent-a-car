class CreateReferences < ActiveRecord::Migration[5.1]
  def change
    create_table :references do |t|
      t.string :name
      t.string :cnic
      t.string :phone
      t.text :address

      t.timestamps
    end
  end
end
