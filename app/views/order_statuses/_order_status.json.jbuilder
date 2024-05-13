json.extract! order_status, :id, :uid, :name, :status, :description, :account_id, :created_at, :updated_at
json.url order_status_url(order_status, format: :json)
