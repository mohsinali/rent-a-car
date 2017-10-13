class Customer < ApplicationRecord
    # Associations
    belongs_to :reference
    has_many :bookings
end
