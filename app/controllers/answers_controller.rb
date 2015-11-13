class AnswersController < ApplicationController

  def create
    answer = current_user.answers.build(answer_params)
    if answer.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content,:question_id)
  end
end