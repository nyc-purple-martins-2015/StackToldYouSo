class AnswersController < ApplicationController

  def create
    # So elegant.  I kiss you.
    answer = current_user.answers.build(answer_params)
    if answer.save
      # So nice, beautiful named route
      redirect_to question_path(answer.question)
    else
      flash[:alert] = "Something went wrong!"
      redirect_to question_path(answer_params[:question_id])
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content,:question_id)
  end
end
