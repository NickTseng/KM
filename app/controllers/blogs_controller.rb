class BlogsController < ApplicationController

	def index
		  @q = Post.search(params[:q])
		if params[:tag]
		  @posts = Post.tagged_with(params[:tag])
		else
	      @posts = @q.result(distinct: true)
		end
	end
end
