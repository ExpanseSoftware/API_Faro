# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def create_account_confirmation
    UserMailer.create_account_confirmation(User.first)
  end
end
