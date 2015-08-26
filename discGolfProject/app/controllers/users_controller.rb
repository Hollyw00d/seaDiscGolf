class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
  	unless session[:user_id]
      redirect_to "/"
    else
      @loggedinUser = User.find(session[:user_id])
    	@user = User.find(params[:id])
    end
  end

  def create
  	@user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
  	  redirect_to "/users/#{@user.id}"
    else
      redirect_to "/users/new"
    end
  end

  def edit
  end

  def delete
  end

  private
    def user_params
      params.require(:user).permit(:first_name,:last_name,:email,:user_type,:password,:password_confirmation)
    end
end
