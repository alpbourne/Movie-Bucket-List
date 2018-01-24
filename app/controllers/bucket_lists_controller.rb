class BucketListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @bucket_lists = current_user.bucket_lists.all
  end

  def new
    @movies = Movie.all
    if current_user
      @bucket_list = BucketList.new
      @bucket_list.movies.build
    else
      flash[:alert] = "Please Log In First"
      redirect_to new_user_session_path
    end
  end

  def create
     @bucket_list = current_user.bucket_lists.build(bucket_list_params)
     if @bucket_list.save
       redirect_to user_bucket_lists_path(current_user)
     else
       flash[:alert] = "Please make sure all fields are filled out correctly"
       redirect_to new_user_bucket_list_path
     end
   end

   def update
     @bucket_list = BucketList.find(params[:id])
     @bucket_list.update_attributes(bucket_list_params)
     if @bucket_list.update_attributes(bucket_list_params)
       redirect_to user_bucket_list_path(current_user, :id => @bucket_list.id)
     else
       redirect_to edit_user_bucket_list_path(current_user, :id => @bucket_list.id)
     end
   end

   def show
     @bucket_list = BucketList.find_by(:id => params[:id])
   end

   def edit
     @movies = Movie.all
     @bucket_list = BucketList.find_by(:id => params[:id])
   end

   def destroy
     @bucket_list = BucketList.find(params[:id])
     @bucket_list.destroy
     redirect_to user_bucket_lists_path(current_user)
   end

private

  def bucket_list_params
    params.require(:bucket_list).permit(:name, :movie_ids => [], :movies_attributes => [:name, :genre, :rating], :bucket_list_movies_attributes => [:seen, :id])
  end
end
