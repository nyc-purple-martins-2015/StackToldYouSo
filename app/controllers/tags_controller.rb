class TagsController < ApplicationController
  def show
    @tag= Tag.includes(:questions).find(params[:id])
    render :show
  end

end
