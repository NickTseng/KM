class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    if Post.create(post_params)
      redirect_to posts_path
    else
      render :new
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      
    end
  end

  def destroy
    @post.destroy()
  end
  


  private

  def post_params
    params.require(:post).permit(:title,:content)
  end

end
