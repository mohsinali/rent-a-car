class CarModel < ApplicationRecord
  # Associations
  belongs_to :make
  has_many :car_versions
end
