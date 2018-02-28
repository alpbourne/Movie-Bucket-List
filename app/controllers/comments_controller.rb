class CommentsController < ApplicationController
  before_action :set_post

  def index
    @comments = @bucket_list.find(params[:bucket_list_id])
  end

  def new
    @bucket_list_movie= BucketListMovie.new(content: params[:content], bucket_list_id: params[:bucket_list_id])
  end

  def create
     @comment = Comment.create(comment_params)
     if @comment.save
       redirect_to user_bucket_list_comments_path(current_user)
     else
       flash[:alert] = "Please make sure all fields are filled out correctly"
       redirect_to :back
     end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :bucket_list_id)
  end

  def set_bucket_list
    @bucket_list = BucketList.find(params[:bucket_list_id])
  end
end
