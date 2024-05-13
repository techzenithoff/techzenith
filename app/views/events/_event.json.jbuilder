json.extract! event, :id, :uid, :slug, :title, :event_category_id, :start_date, :end_date, :start_time, :end_time, :content, :country_id, :city, :address, :phone, :email, :facebook_url, :twitter_url, :tiktok_url, :instagram_url, :linkedin_url, :snapchat_url, :status, :account_id, :created_at, :updated_at
json.url event_url(event, format: :json)
