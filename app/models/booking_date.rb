class BookingDate < ApplicationRecord
  # Association
  belongs_to :car
  belongs_to :booking
end
