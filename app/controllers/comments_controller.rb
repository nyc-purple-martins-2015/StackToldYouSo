class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      # polymorphic paths are a thing and they can do some of this work for you.
      # consider whether this might fit in.
      if comment.commentable_type == "Answer"
        redirect_to question_path(comment.commentable.question_id)
      else
        redirect_to question_path(comment.commentable_id)
      end
    else
      redirect_to root_path
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:note, :commentable_type, :commentable_id)
    end
end
