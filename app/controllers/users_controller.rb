class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.includes(:questions).find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to register_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end
end