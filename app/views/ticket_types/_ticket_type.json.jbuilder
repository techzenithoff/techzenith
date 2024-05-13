json.extract! ticket_type, :id, :uid, :slug, :name, :description, :status, :account_id, :created_at, :updated_at
json.url ticket_type_url(ticket_type, format: :json)
