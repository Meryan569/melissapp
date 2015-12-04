class UserMailer < ActionMailer::Base
  default from: "admin@pinkhoneybee.com"

  def contact_form(email, name, message)
    @message = message
    mail(:from => email,
            :to => 'meryan569@gmail.com',
            :subject => "A new contact form message from #{name}")
  end

  def welcome_email(user)
	    @user = user
	    mail(to: @user.email, subject: 'Welcome!')
  end

end
