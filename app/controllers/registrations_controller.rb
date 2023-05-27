class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    # # {"authenticity_token"=>"[FILTERED]", "user"=>{"email"=>"randomemail@gmail.com", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}, "commit"=>"Sign Up"}
    # params
    # # {"email"=>"randomemail@gmail.com", "password"=>"password", "password_confirmation"=>"password"}
    # params[:user]
    @user = User.new(user_params)
    
    if @user.save
      redirect_to root_path, notice: "Successfully created account"      
    else
      # flash[:alert] = "Something was wrong"
      render :new
    end
    # render plain: @user.save ? "Success!" : "Failed"
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end