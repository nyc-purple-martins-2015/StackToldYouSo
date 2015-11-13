class SessionsController < ApplicationController
  def destroy
    session[:user_id] = nil
    redirect_to topics_path
  end

  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:user][:username])
    if user.password == params[:password]
      # flash[:notice] = "Awesome sauce"
      session[:user_id] = user.id
    else
      flash[:alert] = "bad password"
    end
    redirect_to topics_path
  end
end