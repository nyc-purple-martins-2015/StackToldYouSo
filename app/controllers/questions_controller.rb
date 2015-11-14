class QuestionsController < ApplicationController
  def index
    @questions = Question.search(params[:search])
  end

  def show
    @question = Question.includes(:comments, :tags, :answers).find(params[:id])
  end

  def new
    @question = Question.new
    render :new
  end

  def create
    question = current_user.questions.build(question_params)
    if question.save
      parse_tags(question, question_tag_params) unless question_tag_params.empty?
      redirect_to question_path(question)
    else
      flash[:errors] = "Please try posting your question again!"
      redirect_to new_question_path
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

  def question_tag_params
    params.require(:question).permit(:tags)
  end
end
