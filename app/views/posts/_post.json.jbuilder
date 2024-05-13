json.extract! post, :id, :post_category_id, :uid, :slug, :title, :content, :status, :account_id, :created_at, :updated_at
json.url post_url(post, format: :json)
