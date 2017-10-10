class Car < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :make
  belongs_to :car_model
  has_many :car_photos, dependent: :destroy
  accepts_nested_attributes_for :car_photos,reject_if: proc { |attributes| attributes['image'].blank? }
end
