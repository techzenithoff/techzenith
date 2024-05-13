json.extract! smtp_server_setting, :id, :delivery_method, :authentication_method, :host, :port, :authentication, :user_name, :password, :sending_address, :domain, :enable_starttls_auto, :ssl, :user_id, :created_at, :updated_at
json.url smtp_server_setting_url(smtp_server_setting, format: :json)
