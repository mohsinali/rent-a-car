class Car < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :car_photos, dependent: :destroy
  
end
