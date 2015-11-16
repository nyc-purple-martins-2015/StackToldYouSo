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
    tag_descriptions = params[:tags].split(/[-,\/]/)
    if question.save
      params
      question.parse_tags(tag_descriptions) unless question_tag_params.empty?
      redirect_to question_path(question)
    else
      flash[:errors] = "Please try posting your question again!"
      redirect_to new_question_path
    end
  end

  def edit
    @question = Question.includes(:tags).find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.assign_attributes(question_params)
    if @question.save
      # This is a classic "miss" in terms of OO.  In the original
      # implementation you were finding a question, and then passing that
      # question to some random-ass function that wasn't owned by a model.
      #
      # We asked, who is the thing that does the thinking.  Who is it who has
      # the responsibility for managing the life and times of a Question?
      # Well, a Question class does!  So we moved parse_tags to be a
      # responsibility of a Question.  In so doing we honor the SINGLE
      # RESPONSIBILITY PRINCIPLE of SOLID.  Who manages the concerns about
      # questions?  The QUESTION class does.  This is the heart of OO>
      question.parse_tags(question_tag_params) unless question_tag_params.empty?
      redirect_to user_path(@question.user_id)
    else
      flash[:errors] = "Please try editing your question again!"
      redirect_to user_path(@question)
    end
  end

  def destroy
    @question = Question.includes(:answers, :question_tags,:comments).find(params[:id])
    # You can set up dependent destroy on question and it will do 
    @question.destroy
    redirect_to user_path(@question.user_id)
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

  def question_tag_params
    params.require(:question).permit(:tags)
  end
end
