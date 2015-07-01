class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  #  Define the structure of the "new" form:
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url 
    else
      render 'new'
    end
  
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :email, :password, 
                                 :password_confirmation)
  end

end
