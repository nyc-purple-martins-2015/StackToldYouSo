class QuestionsController < ApplicationController
  def index
    @questions = Question.includes(:comments, :tags, :answers).all.order(updated_at: :desc).limit(10)
  end

  def show
    @question = Question.includes(:comments, :tags, :answers).find(params[:id])
  end

  def new
  end

  def create
    params = params.require(:question).permit(:title, :body)
    @question = Question.new(params, user_id: current_user.id)
    if @question.save
      redirect question

  end
end
