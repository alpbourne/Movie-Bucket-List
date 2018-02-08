class MoviesController < ApplicationController

  def index
    @movies = Movie.all
    #@movie = Movie.find(params[:movie_id])
  end

  def new
    if current_user
      @movie = Movie.new
    else
      flash[:alert] = "Please Log In First"
      redirect_to new_user_session_path
    end
  end

  def create
     @movie = Movie.create(movie_params)
     if @movie.save
       redirect_to movies_path
     else
       flash[:alert] = "Please make sure all fields are filled out correctly"
       redirect_to new_movie_path(movie.id)
     end
   end

  def highest_rating
    @movies = Movie.all
    @highest_rated_family = @movies.where("rating > ? AND genre = ?", 8.5, "Family")
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update_attributes(movie_params)
    if @movie.update_attributes(movie_params)
      redirect_to movies_path
    else
      flash[:alert] = "Please make sure all fields are filled out correctly"
      redirect_to edit_movie_path(movie.id)
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :genre, :rating)
  end
end
