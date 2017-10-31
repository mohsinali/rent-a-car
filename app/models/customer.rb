class Customer < ApplicationRecord
    # Associations
    has_many :bookings

    # Validations
    validates :name, :presence => true
    validates :cnic, :presence => true, :numericality => { :only_integer => true }, length: { is: 13 }
    validates :phone, :presence => true, :numericality => { :only_integer => true }, length: { maximum: 15 }
    validates :address, :presence => true

end
