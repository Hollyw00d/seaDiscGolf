class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
  	@course = Course.find(params[:id])
  end

  def create
  	@course = Course.new(course_params)
  	redirect_to "/courses/#{@course.id}"
  end

  def edit
  end

  def delete
  end

  private
  	def course_params
  		params.require(:course).permit(:name,:street,:state,:zip_code,:google_map)
  	end
end
