module API
    module V1
      class Auth < Grape::API
        include API::V1::Defaults
        #rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found
        

        resource :auth do

            desc "Creates and returns access_token if valid login"
            params do
              requires :email, type: String, desc: "Account name or email address"
              requires :password, type: String, desc: "Password"
            end

            post :login do
=begin
              if params[:login].include?("@")
                Account = Account.find_by_email(params[:login].downcase)
              else
                Account = Account.find_by_login(params[:login].downcase)
              end
          
              if Account && Account.authenticate(params[:password])
                key = AccessCredential.create(Account_id: Account.id)
                {token: key.access_token}
              else
                error!('Unauthorized.', 401)
              end
=end

                email = params[:email].strip if params[:email].present?
                password = params[:password]

                if email.nil? or password.nil?
                    error!({error_code: 404, error_message: "Invalid Email or Password."},401)
                    return
                end


                account = Account.find_by(email: email.downcase)

                if account.nil?
                    error!({status: 404, error_message: "Invalid Email."},401)
                    return
                end

                if !account.valid_password?(password)
                    error!({status: 404, error_message: "Invalid Password."},401)
                    return
                else
                    #Account.ensure_authentication_token!
                    #Account.friendly_token()
                    #Account.save
                    puts "account_ID: #{account.id}"
                    access_credential = AccessCredential.where("account_id = ? AND active =?",  account.id, true).first
                    
                    puts "API KEY: #{access_credential}"
                    if access_credential.present?
                      #{status: 'ok', token: access_credential.access_token}#.to_json
                      {status: 'ok', data: {token: access_credential.access_token, profile: account.role.name}}#.to_json
                    else
                      credential = AccessCredential.create(account_id: account.id)
                      #{token: key.access_token}
                      {status: 'ok', data: {token: credential.access_token, profile: account.role.name}}#.to_json
                    end
                end
            end
          
            desc "Returns pong if logged in correctly"
            params do
              requires :token, type: String, desc: "Access token."
            end
            get :ping do
              authenticate!
              { message: "pong" }
            end
          end

      end
    end
end