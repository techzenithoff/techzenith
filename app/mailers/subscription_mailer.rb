class SubscriptionMailer <  ApplicationMailer
    #include SmtpHelper
    #helper :application
        
    #add_template_helper EmailsHelper
    #add_template_helper ApplicationHelper
    default template_path: 'subscriptions/mailer'
    default from: "Nouvel abonnement <#{Rails.env.production? ? Rails.application.credentials.dig(:email, :production, :user_name) : Rails.application.credentials.dig(:email, :development, :user_name)}>"
    layout 'mailer'

  def subscription_email(subscription)
    @account = Account.find(subscription.account_id)
   
    @subscription = subscription
      
    @url  = Rails.env.production? ? Rails.application.credentials.dig(:email, :production, :host) : Rails.application.credentials.dig(:email, :development, :host)
    

    mail(to: @account.email, subject: "iKataxi - Nouvel abonnement")
  end
end