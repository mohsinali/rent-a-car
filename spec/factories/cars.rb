FactoryGirl.define do
  factory :car do
    registration_no "MyString"
    mileage 1
    last_oil_change "2017-09-28"
    per_day_rent 1
    user nil
  end
end
