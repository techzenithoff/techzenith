json.extract! user, :id, :uid, :first_name, :last_name, :sex, :address, :country_id, :city_id, :phone, :description, :status, :created_at, :updated_at
json.url user_url(user, format: :json)
