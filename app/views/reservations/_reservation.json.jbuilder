json.extract! reservation, :id, :uid, :ticket_id, :quantity, :status, :account_id, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
