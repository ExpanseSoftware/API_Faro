class UserMailer < ApplicationMailer
  default from: 'info@expansesoft.com'

  def create_account_confirmation(user)
    @user = user
    mail(to: @user.user_email, subject: 'Confirma tu cuenta con Faro')
  end
end
