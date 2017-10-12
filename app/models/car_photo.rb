class CarPhoto < ApplicationRecord
  belongs_to :car
  enum image_type: [:front_view,:right_view,:rear_view,:left_view,:other]
  validates :image,:image_type,presence: true
  mount_uploader :image, PhotoUploader
end
