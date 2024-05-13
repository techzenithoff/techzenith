module API
    module V1
      class Signup < Grape::API
        include API::V1::Defaults
       

        resource :account do

            desc "Creates and returns access_token if valid login"
            params do

                requires :lastName, type: String, desc: "Username or email address"
                requires :firstName, type: String, desc: "Username or email address"

                requires :country_id, type: Integer, desc: "Username or email address"
                requires :city_id, type: Integer, desc: "Username or email address"
                requires :email, type: String, desc: "Username or email address"
                requires :password, type: String, desc: "Password"

            end

            post :signup do

                puts "DATA: #{params.inspect}"
                profile = params[:profile].strip if params[:profile].present?
                last_name = params[:lastName].strip if params[:lastName].present?
                first_name = params[:firstName].strip if params[:firstName].present?
                country_id = params[:country_id] if params[:country_id].present?
                city_id = params[:city_id] if params[:city_id].present?
                phone = params[:phone] if params[:phone].present?

                email = params[:email].strip if params[:email].present?
                password = params[:password]
                password_confirmation = password


                if email.nil? or password.nil? or password_confirmation.nil?
                    error!({error_code: 404, error_message: "Invalid Email or Password."},401)
                    return
                end

                if password != password_confirmation
                    error!({error_code: 405, error_message: "Invalid Password."},401)
                    return
                end

                account = Account.where(email: email.downcase).first
                if account.present?
                    puts "ACCOUNT EXIST"
                    error!({error_code: 406, error_message: "L'adresse email déjà utilisée."},401)
                    #{status: 401, message: "L'adresse email saisie n'est pas disponible!"}#.to_json
                    return
                end

                account = Account.new
                account.role_id = Role.find_by(name: profile).id 
                account.email = email
                account.password = password
                account.password_confirmation = password_confirmation


                if profile == "Client"
                      customer = Customer.new
                      customer.first_name = first_name
                      customer.last_name = last_name
                      customer.country_id = country_id
                      customer.city_id = city_id
                      customer.phone = phone
                      puts "CUSTOMER AFTER CREATE: #{customer.inspect}"
                      #customer.build_account(resource)
                      if customer.valid? && account.valid?
                        customer.save
                        account.accountable = customer
                        account.save
                        
                      end
                    else
                      taximan = Taximan.new
                      taximan.first_name = first_name
                      taximan.last_name = last_name
                      taximan.country_id = country_id
                      taximan.city_id = city_id
                      taximan.phone = phone
                      puts "TAXIMAN AFTER CREATE: #{taximan.inspect}"
                      #customer.build_account(resource)
                      if taximan.valid? && account.valid?
                        taximan.save
                        account.accountable = taximan
                        account.save
                        
                      end
                    end

                if account.persisted?

                    
                   

                    
                    puts "USER_ID: #{account.id}"
                    api_key = AccessCredential.where("account_id = ? AND active =?",  account.id, true).first
                    
                    if api_key.present?
                      {status: 'ok', token: api_key.access_token}#.to_json
                    else
                      key = AccessCredential.create(account_id: account.id)
                      #{status: 'ok', token: key.access_token}#.to_json
                      {status: 201, message: "L'inscription a été faite avec succès!"}#.to_json
                    end
                else
                    #{status: 'error'}#.to_json
                    error!({error_code: 406, error_message: "Erreur."},401)


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