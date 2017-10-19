class Customer < ApplicationRecord
    # Associations
    # has_many :references
    has_many :bookings
    # accepts_nested_attributes_for :references, :reject_if => lambda { |c| c[:name].blank? || c[:cnic].blank?|| c[:address].blank?|| c[:phone].blank?}

end
