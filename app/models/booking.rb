class Booking < ApplicationRecord
    # Associations
    belongs_to :car
    belongs_to :customer
    belongs_to :reference
    has_many :booking_dates
end
