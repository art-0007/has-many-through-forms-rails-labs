class PostsController < ApplicationController
  before_action :set_post!, only: %i[show destroy edit update]
 
  def index
    @posts = Post.all
  end

  def show 
  end

  def new
    @post = Post.new
    2.times do
    @post.categories.build
    end
  end

  def create
    @post = Post.create(post_params)
    if @post.save
    redirect_to @post
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Post deleted!"
    redirect_to posts_path
  end

  def edit
  end

  def update
    if @post.update post_params
      flash[:success] = "Post updated!"
      redirect_to post_path
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end

  def set_post!
    @post = Post.find(params[:id])
  end
end
