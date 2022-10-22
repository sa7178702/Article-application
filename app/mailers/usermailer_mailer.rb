class UsermailerMailer < ApplicationMailer

	def welcome_email(user)
      mail(to: 'sa7178702@gmail.com', subject: 'Sign In successful')
   end
end
