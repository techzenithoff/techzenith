json.extract! order, :id, :uid, :customer_id, :restaurant_id, :status, :created_at, :updated_at
json.url order_url(order, format: :json)
