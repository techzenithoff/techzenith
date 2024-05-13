module API
  module V1
    module Defaults
      extend ActiveSupport::Concern
        include ActionController::HttpAuthentication::Token::ControllerMethods
      #rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

      included do
          prefix "api"
          version "v1", using: :path
          default_format :json
          format :json
          formatter :json, Grape::Formatter::ActiveModelSerializers
  

          before do
            #error!("401 Unauthorized, 401") unless authenticated
            authenticate
          end

            
          helpers do
            def permitted_params
              @permitted_params ||= declared(params, include_missing: false)
            end
  
            def logger
              Rails.logger
            end

            # For auth
            def authenticate
              #error!('Unauthorized. Invalid or expired token.', 401) unless current_account
              authenticate_account_with_token || handle_bad_authentication
            end
        
            def authenticate_account_with_token
              # find token. Check if valid.
              #token = ApiKey.where(access_token: params[:token]).first
              #if token && !token.expired?
              #  @current_user = User.find(token.user_id)
              #else
               # false
              #end

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
  
          rescue_from ActiveRecord::RecordNotFound do |e|
            error_response(message: e.message, status: 404)
          end
  
          rescue_from ActiveRecord::RecordInvalid do |e|
            error_response(message: e.message, status: 422)
          end
      end
    end
  end
end
  