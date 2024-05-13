json.extract! event_category, :id, :uid, :slug, :title, :description, :status, :account_id, :created_at, :updated_at
json.url event_category_url(event_category, format: :json)
