class CommentsController < ApplicationController

  def index
    @comments = Comment.all 
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new(comment_params) 
  end

  def create
    if params[:comment][:user_id].empty?
      #binding.pry
      @user = User.new(username: params[:comment][:user_attributes][:username])
      @user.save
    else
      @user = User.find(params[:comment][:user_id])
    end
    @comment = Comment.create(content: params[:comment][:content], user_id: @user.id, post_id: params[:comment][:post_id])

    redirect_to @comment.post
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
end
