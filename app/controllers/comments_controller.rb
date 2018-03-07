class CommentsController < ApplicationController
  before_action :set_bucket_list

  def index
    @comments = @bucket_list.comments
    # render 'comments/index', :layout => false
    # render :json => @comments, :layout => false
    respond_to do |f|
      f.html { render layout: false }
      f.json {render json: @comments, :layout => false}
    end
  end

  def create
    @comment = @bucket_list.comments.build(comment_params)
    if @comment.save
      render json: @comment, status: 201
    else
      render "bucket_lists/show"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_bucket_list_path(current_user, :id => @bucket_list.id)
  end

  # def new
  #   @comment = Comment.new
  #   binding.pry
  # end

  # def create
  #    @comment = Comment.create(comment_params)
  #    # if @comment.save
  #    #   redirect_to user_bucket_list_comments_path(current_user)
  #    # else
  #    #   flash[:alert] = "Please make sure all fields are filled out correctly"
  #    #   redirect_to :back
  #    # end
  # end


  private

  def comment_params
    params.require(:comment).permit(:content, :bucket_list_id)
  end

  def set_bucket_list
    @bucket_list = BucketList.find(params[:bucket_list_id])
  end
end
