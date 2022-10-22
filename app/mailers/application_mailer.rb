class ApplicationMailer < ActionMailer::Base
  default from: "sa7178702@gmail.com"
  layout "mailer"

  def welcome_email(user)
      mail(to: @user.email, subject: 'Sign In successful')
   end
end
