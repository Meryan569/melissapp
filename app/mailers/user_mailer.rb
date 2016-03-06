class UserMailer < ApplicationMailer
  default from: "meryan569@gmail.com"

  def contact_form(email, name, message)
    @message = message
    mail(:from => email,
      :to => 'meryan569@gmail.com',
      :subject => "A new contact form message from #{name}")
  end

  def welcome(user)
    @appname = "Melissapp"
    mail(:to => user.email,
       :subject => "Welcome to #{@appname}!")
  end

  def payment_confirmation(user)
    mail(:to => user.email,
      :subject => "Your payment confirmation from Pink Honeybee designs")
  end
  
end