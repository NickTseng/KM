class BlogsController < ApplicationController

	def index
		if params[:tag]
			@posts = Post.tagged_with(params[:tag])
		else
			# @posts = Post.all
      @q = Post.search(params[:q])
      @posts = @q.result(distinct: true)
		end
	end
end
