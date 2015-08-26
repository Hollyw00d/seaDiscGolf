class CommentsController < ApplicationController
	def create
		@comment = Comment.new(comment_params)
		redirect_to "/courses/#{@comment.course_id}"
	end

	def delete
		
	end

	private
		def comment_params 
			params.require(:comment).permit(comment:params[:comment],user: User.find(params[:user_id]),course: Course.find(params[:course_id]))
		end
end
