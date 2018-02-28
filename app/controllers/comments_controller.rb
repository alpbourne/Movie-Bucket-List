class CommentsController < ApplicationController
  before_action :set_post

  def index
    @comments = @bucket_list.find(params[:bucket_list_id])
  end

  def new
    if current_user
      @comment = Comment.new
    else
      flash[:alert] = "Please Log In First"
      redirect_to new_user_session_path
    end
  end

  def create
     @comment = Comment.create(comment_params)
     # if @comment.save
     #   redirect_to movies_path
     # else
     #   flash[:alert] = "Please make sure all fields are filled out correctly"
     #   redirect_to new_movie_path(movie.id)
     # end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_bucket_list
    @bucket_list = BucketList.find(params[:post_id])
  end
end
