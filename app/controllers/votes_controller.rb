class VotesController < ApplicationController

  def create
    vote = Vote.new(vote_params)

    if vote.save
      if vote.votable_type == "Answer"
        id = vote.votable.question_id
        redirect_to question_path(id)
      else
        id = vote.votable_id
        redirect_to question_path(id)
      end
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:value, :user_id, :votable_type, :votable_id)
  end

end
