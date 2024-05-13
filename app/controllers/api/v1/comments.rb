module API
    module V1
      class Comments < Grape::API
        include API::V1::Defaults
        resource :comments do
          desc "Return all comments"
          get "" do
            Comment.all
          end


          desc "Return all comments."
          params do
            requires :user_token, type: String, desc: "Password"
          end
          get "/user/:user_token"  do
            api_key = ApiKey.find_by(access_token: params[:user_token])
            puts "API KEY: #{api_key}"
            
            if api_key.present?
              puts "API KEY PRESENT}"
                user = User.find(api_key.user_id)
                
               
                
                if user.present? 
                  puts "USER PRESENT}"
                  comments = user.comments
                   
                  {status: 'ok', comments: comments}
                else
                    {status: "no"}
                end
               

            else
                error!({error_code: 422, error_message: "Impossible de traiter la requette."},422)
                return
            end
          end




          desc "Create new comment."
          params do
            requires :poll_item_id, type: Integer, desc: "Username or email address"
            requires :content, type: String, desc: "Password"
            requires :user_token, type: String, desc: "Password"
          end
          post :new do
            puts "BEFORE"
            user = ApiKey.find_by(access_token: params[:user_token])
            
            puts "REMOTE USER: #{user}"
            if user.present?
                comment = Comment.new
                comment.poll_item_id = params[:poll_item_id]
                comment.content = params[:content]
                comment.user_id = user.user_id
                
                if comment.save!
                
                   
                  {status: 'ok', comment: comment}
                else
                    {status: "no"}
                end
               

            else
                error!({error_code: 422, error_message: "Impossible de traiter la requette."},422)
                return
            end
          end

      

          desc "Return a comment"
          params do
            requires :id, type: Integer, desc: "ID of the user"
          end
          get ":id" do
            Comment.find(params[:id])
          end

          desc "Return a comment"
          params do
            requires :poll_item_id, type: Integer, desc: "ID of the user"
          end
          get "/by/poll_item/:poll_item_id" do
            Comment.where(poll_item_id: params[:poll_item_id])
          end

        end
      end
    end
  end