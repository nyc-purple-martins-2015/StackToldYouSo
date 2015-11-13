class UsersController < ApplicationController


  def create
    @user = User.new(params[:user])
    if @user.save
      redirect root_path
    else
      redirect register_path
    end
  end

end