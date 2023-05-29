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
end