class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000/cats'
    mail(to: "#{user.username}@gmail.com", subject: 'Welcome!')
  end
end
