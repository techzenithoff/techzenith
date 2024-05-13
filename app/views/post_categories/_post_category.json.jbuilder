json.extract! post_category, :id, :uid, :slug, :name, :description, :status, :account_id, :created_at, :updated_at
json.url post_category_url(post_category, format: :json)
