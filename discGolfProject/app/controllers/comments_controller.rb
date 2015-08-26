class CommentsController < ApplicationController
	def create
		@comment = Comment.new(comment_params)
		redirect_to "/courses/#{@comment.course_id}"
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
		comment = Comment.find(params[:id])
    	comment.destroy
    	redirect_to "/courses/#{@comment.course_id}"
	end

	private
		def comment_params 
			params.require(:comment).permit(comment:params[:comment],user: User.find(params[:user_id]),course: Course.find(params[:course_id]))
		end
end
