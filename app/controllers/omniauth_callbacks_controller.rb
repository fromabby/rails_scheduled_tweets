class OmniauthCallbacksController < ApplicationController
  def twitter
    render plain: "Successfully logged in"
  end
end