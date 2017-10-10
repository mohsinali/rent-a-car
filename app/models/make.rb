class Make < ApplicationRecord
  # Associations
  has_many :car_models, dependent: :destroy
  has_many :cars, dependent: :destroy
end
