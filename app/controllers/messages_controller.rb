class MessagesController < ApplicationController
	layout "front"
	 def new
    @message = Message.new
  end
def create
    @message = Message.new message_params
if @message.valid?
      MessageMailer.contact(@message).deliver_now
      redirect_to new_message_url
      flash[:notice] = "Nous avons bien reçu votre message et nous vous contacterons bientôt !"
    else
      flash[:notice] = "Une erreur est survenue lors de l'envoi de votre message. Veuillez réessayer."
      render :new
    end
  end
private
def message_params
    params.require(:message).permit(:name, :email, :phone_number, :body)
  end
end
