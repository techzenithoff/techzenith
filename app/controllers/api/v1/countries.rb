module API
    module V1
      class Countries < Grape::API
        include API::V1::Defaults
        resource :countries do
          desc "Return all poll_categories"
          get "" do
            Country.all
          end


          desc "Return by uid"
          params do
            requires :uid, type: String, desc: "ID of the user"
          end
          get "/search/:name" do 
              Country.find_by(uid: permitted_params[:uid]) 
          end


          desc "Return by uid"
          params do
            requires :uid, type: String, desc: "ID of the user"
          end
          get "/by/:uid" do 
            puts "CARD"
            card = Countrie.find_by(uid: permitted_params[:uid]) 
            
            # If card present
            if card.present?

              puts "CARD UID: #{card.inspect}"
              customer_fidelity_card = card.customer_fidelity_card
              
              # If customer fidelity cardcard present
              if customer_fidelity_card.present?

                puts "CUSTOMER FIDELITY: #{customer_fidelity_card.inspect}"
                
                order = Order.where(customer_id: customer_fidelity_card.customer_id,   paid: "Impayée", status: "En attente").first
                
                puts "ORDER: #{order.inspect}"
                if order.present?

                  # Payment processing
                  if  payment?(card, order )
                    {status: 'ok', message: "Paiement effectué avec succès!"}
                  else
                    {status: 'error', message: "Erreur de paiment veuillez contactez le service de gestion des cartes."}
                  end
                else
                  {status: 'error', message: "Aucune commande trouvé pour ce client."}
                end 

              else
                
                {status: "error", message: "Carte non attribuée ou inactive"} 
              end
            else
              puts "Cette carte n'existe pas!"
              {status: "error", message: "Cette carte n'existe pas!"} 
            end

          end



        desc "Return a poll_tems"
          params do
            requires :id, type: String, desc: "ID of the user"
          end
          get ":id" do
            PollCategory.where(id: permitted_params[:id]).first!
          end
        end
      end
    end
  end