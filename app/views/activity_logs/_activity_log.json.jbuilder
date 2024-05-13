json.extract! activity_log, :id, :uid, :user_id, :browser, :ip_address, :controller, :action, :params, :note, :created_at, :updated_at
json.url activity_log_url(activity_log, format: :json)
