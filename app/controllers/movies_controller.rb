class MoviesController < ApplicationController
  def index
    @movies = fetch_movies
  end

  private

  def fetch_movies
    if params[:sort_by_average_stars] == 'true'
      return Movie.select("movies.*, AVG(reviews.stars) AS avg_ratings")
                  .joins(:reviews).group("movies.id").order("avg_ratings DESC")
    end

    return Movie.search_by_actor_name(params[:actor].strip) if params[:actor].present?

    Movie.all
  end
end
