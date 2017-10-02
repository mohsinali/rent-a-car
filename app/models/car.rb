class Car < ApplicationRecord
  # Associations
  belongs_to :user
  # belongs_to :car_version
  # has_many :photos, inverse_of: :car, dependent: :destroy
  
end
