class BucketListMoviesController < ApplicationController

  def new
    @movie_id = params[:movie_id]
    @bucket_list_movie= BucketListMovie.new(bucket_list_id: params[:bucket_list_id], movie_id: params[:movie_id], seen: params[:seen])
  end

  def create
    @bucket_list = BucketList.find_by(:id => params[:bucket_list_movie][:bucket_list_id])
    if current_user
      @bucket_list.movies << Movie.find(params[:movie_id])
      @bucket_list.save
      redirect_to user_bucket_lists_path(current_user)
    else
      flash[:alert] = "Please make sure all fields are filled out correctly"
      redirect_to new_bucket_list_movie_path(movie_id: movie.id)
    end

    def show
      @bucket_list_movies = BucketListMovie.all
      @seen = @bucket_list_movies.where("seen = true")
      # {|m| m.seen == true}
    end

  end

end
