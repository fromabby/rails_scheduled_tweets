class OmniauthCallbacksController < ApplicationController
  def twitter
    # render plain: "Successfully logged in"

    Rails.logger.info twitter_auth

    # check duplicate
    # update account if existing
    twitter_account = Current.user.twitter_accounts.where(username: twitter_auth.info.nickname).first_or_initialize
    twitter_account.update(
      name: twitter_auth.info.name,
      image: twitter_auth.info.image,
      token: twitter_auth.credentials.token,
      secret: twitter_auth.credentials.secret,
    )

    redirect_to root_path, notice: "Successfully connected your account"
  end

  # give hash of credentials back from twitter
  def twitter_auth
    request.env['omniauth.auth']
  end
end
