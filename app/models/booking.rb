class Booking < ApplicationRecord
    # Associations
    belongs_to :car, dependent: :destroy
    belongs_to :customer
    has_many :references
    accepts_nested_attributes_for :customer
    accepts_nested_attributes_for :references, :reject_if => lambda { |c| c[:name].blank? || c[:cnic].blank?|| c[:address].blank?|| c[:phone].blank?}
  
    # Validations
    validates :booking_price, :presence => true, :numericality => true
    validates_numericality_of :booking_price, :greater_than_or_equal_to => Proc.new { |r| r.advance_payment }
    validates :number_of_days, :presence => true, :numericality => { :only_integer => true }
    validates :from_booking, :presence => true
    validates :to_booking, :presence => true
    validates :advance_payment, :presence => true

end
