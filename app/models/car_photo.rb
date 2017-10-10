class CarPhoto < ApplicationRecord
  belongs_to :car
  enum image_type: [ :other,:front_view,:rear_view,:left_view,:right_view]
end
