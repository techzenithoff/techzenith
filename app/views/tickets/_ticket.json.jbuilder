json.extract! ticket, :id, :uid, :slug, :ticket_type_id, :name, :event_id, :price, :available_quantity, :description, :status, :account_id, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
