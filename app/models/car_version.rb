class CarVersion < ApplicationRecord
  # Associations
  has_many :cars
  belongs_to :car_model
end
