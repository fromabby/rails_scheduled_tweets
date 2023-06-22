# rails credentials:edit --environment=development

class TwitterAccountsController < ApplicationController
  before_action :require_user_logged_in!

  def index
    # if Current.user
    #   @twitter_accounts = Current.user.twitter_accounts
    # else
    #   redirect_to root_path
    # end
   
    @twitter_accounts = Current.user.twitter_accounts
  end

  def destroy
    @twitter_account = Current.user.twitter_accounts.find(params[:id])

    @twitter_account.destroy
    
    redirect_to twitter_accounts_path, alert: "Successfully disconnected @#{@twitter_account.username}"
  end
end
