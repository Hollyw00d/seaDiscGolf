class CoursesController < ApplicationController
  def index
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
    @courses = Course.all
  end

  def show
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  	@course = Course.find(params[:id])
  end

  def new
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      redirect_to '/'
    end
  end

  def create
    puts comment
  	@course = Course.create(course_params)
  	redirect_to "/courses/#{@course.id}"
  end

  def edit
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    @course.update(course_params)
    redirect_to "/courses/#{@course.id}"
  end

  def delete
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to "/"
  end

  private
  	def course_params
  		params.require(:course).permit(:name,:street,:city,:state,:zip_code,:google_map)
  	end
end
