class QuestionsController < ApplicationController
  def index
    @questions = Question.includes(:comments, :tags, :answers).all.order(updated_at: :desc).limit(10)
  end

  def show
    @question = Question.includes(:comments, :tags, :answers).find(params[:id])
  end
end
