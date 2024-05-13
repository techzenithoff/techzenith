json.extract! candidate, :id, :uid, :slug, :candidate_category_id, :name, :title, :content, :status, :account_id, :created_at, :updated_at
json.url candidate_url(candidate, format: :json)
