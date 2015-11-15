module ApplicationHelper
  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def already_voted?(user, remark)
    return true if user.votes.where(votable_id: remark.id).empty?
  end

end
