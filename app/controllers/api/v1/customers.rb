module API
    module V1
      class Customers < Grape::API
        include API::V1::Defaults
        
        resource :customers do
          desc "Return all poll_tems"
          get "" do
            PollItem.all
          end

        
          

          desc "Return poll item by poll id"
          params do
            requires :poll_id, type: Integer, desc: "ID of the user"
          end
          get "/search/by/poll/:poll_id" do 
              poll_items = PollItem.where(poll_id: permitted_params[:poll_id])
              

              if poll_items
                puts "POLL ITEM FOND: #{poll_items.inspect}"
                
                
                poll_items 
 

              else
                error!({error_code: 422, error_message: "Impossible de traiter la requette."},422)
                  return
              end
          end



          desc "Check if user can commenting or voting"
          params do
            requires :user_token, type: String, desc: "ID of the user"
            requires :poll_item_id, type: Integer, desc: "ID of the user"

          end
          get "/can_commenting_and_voting/:user_token/:poll_item_id" do 

            api_key = ApiKey.find_by(access_token: params[:user_token])
            
            
            if api_key.present?
              
              user = User.find(api_key.user_id)
              
                if user.present? 
                  voting_another_poll_item = voting_another_poll_item?(user.id, params[:poll_item_id])
                  commenting_another_poll_item = commenting_another_poll_item?(user.id, params[:poll_item_id])

                  if !voting_another_poll_item && !commenting_another_poll_item
                    puts "NA PAS VOTEZ POUR QUELQU'UN D'AUTRE"
                    voting_current_poll_item = voting_current_poll_item?(user.id, params[:poll_item_id])
                    commenting_current_poll_item = commenting_current_poll_item?(user.id, params[:poll_item_id])

                    puts "COMMENTING CURRENT POLL ITEM: #{commenting_current_poll_item}"
                    puts "VOTING CURRENT POLL ITEM: #{voting_current_poll_item}"
                    {status: 'ok', can_commenting: !commenting_current_poll_item, can_voting: !voting_current_poll_item }
                  else
                      {status: "no"}
                  end
                else
                  puts "TU A DEJA VOTE POUR QUELQU'UN D'AUTRE"
                  error!({error_code: 422, error_message: "Impossible de traiter la requette."},422)
                  return
                end
               

            else
                error!({error_code: 422, error_message: "Impossible de traiter la requette."},422)
                return
            end
          end



        desc "Return a poll_tems"
          params do
            requires :id, type: Integer, desc: "ID of the user"
          end
          get ":id" do
            PollItem.find(permitted_params[:id])
          end
        end
      end
    end
  end