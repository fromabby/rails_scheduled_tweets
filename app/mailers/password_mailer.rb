class PasswordMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.password_mailer.reset.subject
  #
  def reset
    @token = params[:user].signed_id(expires_in: 15.minutes, purpose: "password_reset")
    # mail to: email_params
    mail to: params[:user].email
  end

  private

  def email_params
    params.require(:user).permit(:email)
  end
end
