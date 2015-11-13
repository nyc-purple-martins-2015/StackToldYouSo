class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:note, :commentable_type, :commentable_id)
    end
end
