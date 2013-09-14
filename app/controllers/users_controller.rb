class UsersController < ApplicationController
  def new
  	@user=User.new
  end

  def index
  	@users = User.all.order("name ASC")
  end

  def show
  	@user=User.find(params[:id])
  end

  def create
	@user = User.new(params[:user])
	if @user.save
		redirect_to root_path, :notice => 'Welcome! You are a StoreNav member now!', :id => @user.id
	else
		render 'new'
	end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end

end
