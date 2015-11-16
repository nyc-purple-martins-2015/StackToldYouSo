module ApplicationHelper
  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  # Seems like this could go on a model...
  def already_voted?(user, remark)
    return true if user.votes.where(votable_id: remark.id).empty?
  end

end
