
class MessageMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def contact(message)
  end
end
