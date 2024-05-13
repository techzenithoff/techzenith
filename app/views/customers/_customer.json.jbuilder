json.extract! customer, :id, :uid, :first_name, :last_name, :sex, :address, :country, :city, :phone, :description, :status, :created_at, :updated_at
json.url customer_url(customer, format: :json)
