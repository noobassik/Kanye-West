# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def send_new_user_message
    user = User.first
    UserMailer.send_new_user_message(user)
  end
end
