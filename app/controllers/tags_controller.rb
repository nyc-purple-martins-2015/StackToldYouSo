class TagsController < ApplicationController
  def show
    # rad.
    @tag= Tag.includes(:questions).find(params[:id])
    render :show
  end

end
