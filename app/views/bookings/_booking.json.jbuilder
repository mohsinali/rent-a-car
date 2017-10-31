json.extract! booking, :id, :car_id, :customer_id, :booking_price, :number_of_days, :booking_datetime, :advance_payment, :created_at, :updated_at
json.url booking_url(booking, format: :json)
