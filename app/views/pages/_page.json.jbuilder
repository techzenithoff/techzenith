json.extract! page, :id, :uid, :slug, :title, :content, :status, :account_id, :created_at, :updated_at
json.url page_url(page, format: :json)
