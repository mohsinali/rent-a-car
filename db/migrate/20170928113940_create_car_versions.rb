class CreateCarVersions < ActiveRecord::Migration[5.1]
  def change
    create_table :car_versions do |t|
      t.string :name
      t.references :car_model, foreign_key: true

      t.timestamps
    end
  end
end
