FactoryGirl.define do
  factory :booking do
    car_id 1
    customer_id 1
    booking_price 1.5
    number_of_days 1
    booking_datetime "2017-10-11 15:51:03"
    advance_payment 1.5
  end
end
