class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def contact_form(email, name, message)
    @message = message
    mail(:from => email,
            :to => 'meryan569@gmail.com',
            :subject => "A new contact form message from #{name}")
  end
end
