class CommentsController < ApplicationController
	def create
		@user= User.find(session[:user_id])
		@course = Course.find(params[:comment][:course_id])
		@comment = Comment.create(comment_params)
		redirect_to "/courses/#{params[:comment][:course_id]}"
	end

	def edit
		@commentEdit = Comment.find(params[:id])
	end

	def update
		@commentUpdate = Comment.find(params[:id])
    	@commentUpdate.save
    	redirect_to "/courses/#{@comment.course_id}"
	end

	def delete
		@comment = Comment.find(params[:id])
    	@comment.destroy
    	redirect_to "/courses/#{@comment.course_id}"
	end

	private
		def comment_params 
			params.require(:comment).permit(:content,:user_id,:course_id)
		end
end
