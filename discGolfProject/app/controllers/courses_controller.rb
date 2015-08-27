class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
  	@course = Course.find(params[:id])
  end

  def new
  end

  def create
  	@course = Course.create(course_params)
  	redirect_to "/courses/#{@course.id}"
  end

  def edit
    @courseEdit = Course.find(params[:id])
  end

  def update
    @courseUpdate = Course.find(params[:id])
    @courseUpdate.save
    redirect_to "/courses/#{@course.id}"
  end

  def delete
    course = Course.find(params[:id])
    course.destroy
    redirect_to "/"
  end

  private
  	def course_params
  		params.require(:course).permit(:name,:street,:city,:state,:zip_code,:google_map)
  	end
end
