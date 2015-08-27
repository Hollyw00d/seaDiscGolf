class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end

  def show
  	unless session[:user_id]
      redirect_to "/"
    else
      @loggedinUser = User.find(session[:user_id])
    	@user = User.find(params[:id])
    end
  end

  def login
  end

  def userLogin
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      # session[:user_id] = user.user_id
      session[:user_id] = user.id
      redirect_to "/users/#{user.id}"
    else
      redirect_to "/users"
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to "/"
  end

  def create
  	user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
  	  redirect_to "/users/#{user.id}"
    else
      redirect_to "/users/new"
    end
  end

  def edit
    @userEdit = Course.find(params[:id])
  end

  def update
    @userUpdate = User.find(params[:id])
    @userUpdate.save
    redirect_to "/users/#{@user.id}"
  end

  def delete
    user = Course.find(params[:id])
    user.destroy
    redirect_to "/users"
  end

  private
    def user_params
      params.require(:user).permit(:first_name,:last_name,:email,:user_type,:password,:password_confirmation)
    end
end
