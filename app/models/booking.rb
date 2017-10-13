class Booking < ApplicationRecord
    # Associations
    belongs_to :car
    belongs_to :customer
    belongs_to :reference
  
end
