class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def comment_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'New comment for your post')
  end
end
