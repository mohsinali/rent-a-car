class CarModel < ApplicationRecord
  # Associations
  belongs_to :make
  has_many :car_versions, dependent: :destroy
  has_many :cars, dependent: :destroy
end
