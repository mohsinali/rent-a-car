class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars do |t|
      t.string :registration_no
      t.integer :mileage
      t.date :last_oil_change
      t.integer :per_day_rent
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
