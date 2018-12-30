class ApplicationMailer < ActionMailer::Base
  default from: 'gfd@gfd.com'
  layout 'mailer'

  def welcome_email
    @user = params[:email]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
