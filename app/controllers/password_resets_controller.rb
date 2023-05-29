class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user.present?
      # go to password  mailer
      # send reset email but we want to include where to send
      # this will set up "params" in mailer
      # call deliver_later as a background job
      # since it takes a while to connect
      # similar to synchronous in JS

      # deliver_now = async
      # deliver_later = sync
      PasswordMailer.with(user: @user).reset.deliver_later  
    else
      render :new
    end
    redirect_to root_path, notice: "Check your email for the reset password link"
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: "password_reset")

  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to sign_in_path, alert: "Your token has expired"

    if @user.present?
    end
  end

  def update
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    if @user.update(password_params)
      redirect_to root_path, notice: "Your password was reset successfully."
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end