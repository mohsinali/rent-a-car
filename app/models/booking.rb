class Booking < ApplicationRecord
    # Associations
    belongs_to :car
    belongs_to :customer
    has_many :references
    accepts_nested_attributes_for :customer
    accepts_nested_attributes_for :references, :reject_if => lambda { |c| c[:name].blank? || c[:cnic].blank?|| c[:address].blank?|| c[:phone].blank?}
  
end
