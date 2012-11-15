class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])

		#the .create method gonna :
		#create,save and link 
		#a new comment to his post
		@comment = @post.comments.create(params[:comment])

		redirect_to post_path(@post)
	end

	def destroy
	    @post = Post.find(params[:post_id])
	    @comment = @post.comments.find(params[:id])
	    @comment.destroy
	    redirect_to post_path(@post)
	 end
end
