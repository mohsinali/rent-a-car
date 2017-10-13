class Reference < ApplicationRecord
    # Associations
    has_many :bookings
    has_many :customers
end
