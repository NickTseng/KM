class BlogsController < ApplicationController

	def index
		  @q = Post.search(params[:q])
    if params[:tag]
		  @posts = Post.tagged_with(params[:tag])
		else
	    @posts = @q.result(distinct: true)
		end
      @posts = @posts.paginate(:page => params[:page], :per_page => 1)
	end
	
	def	like
    @post = Post.find(params[:id])
    @post.liked_by current_user  
        
    respond_to do | format |  
    	format.html {}
    	format.js {}  
    	#format.js {render :layout => false}  
    end
	end
	
	
end
