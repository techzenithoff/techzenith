module API
    module V1
      class Users < Grape::API
        include API::V1::Defaults

        resource :users do
          desc "Return all users"
          get "" do
            User.all
          end


          desc "Return by name"
          params do
            requires :query, type: String, desc: "ID of the user"
          end
          get "/search/:query" do 

              by_locality = User.search_by_locality(permitted_params[:query])

              if by_locality.present?
                by_locality
              else
                User.profile_search(permitted_params[:query]) 
              end


 
          end


          desc "Get by token"
          params do
            requires :user_token, type: String, desc: "ID of the user"
          end
          get "/token/:user_token" do 

            api_key = ApiKey.find_by(access_token: params[:user_token])

              if api_key.present?
               
                
                user = User.find(api_key.user_id)
                
                if user.present?
                
                   
                  {status: 'ok', user: user}
                else
                    {status: "no"}
                end
               

            else
                error!({error_code: 422, error_message: "Impossible de traiter la requette."},422)
                return
            end


 
          end


       

          desc "Return a user"
          params do
            requires :user_id, type: Integer, desc: "ID of the user"
          end
          get ":user_id" do

            puts "USER ID: #{params[:user_id]}"

            User.find(params[:user_id])
          end
        end


      end
    end
  end