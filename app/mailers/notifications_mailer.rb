class NotificationsMailer < ActionMailer::Base

  default :from => "city2roots@gmail.com"
  default :to => "city2roots@gmail.com"

  def new_message(message)
    @message = message
    mail(:subject => "[YourWebsite.tld] #{message.subject}")
  end

end