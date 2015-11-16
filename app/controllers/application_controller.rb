class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def require_sign_in
    if !logged_in?
      flash[:warn] = "You are not logged in, please log in!"
      redirect_to topics_path
    end
  end

  def authorize_user!
    redirect_to new_session_path unless current_user.present?
  end

end
