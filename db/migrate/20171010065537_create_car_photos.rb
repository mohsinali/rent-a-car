class CreateCarPhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :car_photos do |t|
      t.string :image
      t.integer :image_type,default: 0
      t.integer :car_id

      t.timestamps
    end
  end
end
