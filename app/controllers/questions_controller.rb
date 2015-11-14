class QuestionsController < ApplicationController
  def index
    @questions = Question.includes(:comments, :tags, :answers).all.order(updated_at: :desc)
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
      tags = question_tag_params[:tags].split(",")
      tags.each do |tag|
        new_tag = Tag.find_or_create_by(description: tag)
        unless question.tags.include?(new_tag)
          question.tags << new_tag
        end
      end
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
