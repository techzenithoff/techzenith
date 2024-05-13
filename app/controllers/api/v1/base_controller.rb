class API::V1::BaseController < ActionController::Base
     
  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  before_action :authenticate

  attr_reader :current_account

  private

  def authenticate
    authenticate_account_with_token || handle_bad_authentication
  end

  def authenticate_account_with_token
    authenticate_with_http_token do |token, options|
      puts "TOKEN: #{token}"
      #current_api_token = AccessToken.where(active: true).find_by_token(token)
      current_api_token = AccessToken.find_by_token(token)
      puts "ACCOUNT: #{current_api_token.inspect}"
      @current_account = current_api_token&.account
    end
  end

  def handle_bad_authentication
    render json: { message: "Bad credentials" }, status: :unauthorized
  end

  def handle_not_found
    render json: { message: "Record not found" }, status: :not_found
  end
end