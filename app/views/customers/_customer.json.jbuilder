json.extract! customer, :id, :name, :cnic, :phone, :address, :reference_id, :created_at, :updated_at
json.url customer_url(customer, format: :json)
