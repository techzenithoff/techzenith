class AccountMailer <  ApplicationMailer
    #include SmtpHelper
    #helper :application
        
    #add_template_helper EmailsHelper
    #add_template_helper ApplicationHelper
    default from: "Inscription <#{Rails.env.production? ? Rails.application.credentials.dig(:email, :production, :user_name) : Rails.application.credentials.dig(:email, :development, :user_name)}>"
    layout 'mailer'
=begin
  def welcome_email(account, password)
    @account = Account.find(account.id)
    @password = password
      
      
    @url  = Rails.env.production? ? Rails.application.credentials.dig(:email, :production, :host) : Rails.application.credentials.dig(:email, :development, :host)
    

    mail(to: @account.email, subject: "Bienvenue sur iKataxi!")
  end
=end
end