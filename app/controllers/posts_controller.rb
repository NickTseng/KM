class PostsController < ApplicationController

  before_filter :log_impression, :only=>[:show]

  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
    else
      # @posts = Post.all
      @q = Post.search(params[:q])
      @posts = @q.result(distinct: true)
    end
  end

  def like
    @post = Post.find(params[:id])
    @post.liked_by current_user
    redirect_to posts_path
  end

  def unlike
    @post = Post.find(params[:id])
    @post.unliked_by current_user
    redirect_to posts_path
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
    @post = Post.find(params[:id])
    @post.destroy()
    redirect_to posts_path
  end

  def log_impression
    @post = Post.find(params[:id])
    @post.impressions.create(ip_address: request.remote_ip,post_id: params[:id])
  end

  #show by blog
  def showBlog
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title,:content,:tag_list)
  end

end
