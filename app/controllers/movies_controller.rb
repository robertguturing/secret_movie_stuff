class MoviesController < ApplicationController
  MOVIES_PER_PAGE = 50
  
  def index
    @movies = Movie.paginate(page: params[:page], per_page: MOVIES_PER_PAGE)
    render json: @movies, each_serializer: MovieSerializer
  end

  private

  def page
    params[:page] || 1
  end
end
