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
	@user = User.new(user_params)
	
      if @user.save   
      sign_in @user 
        flash[:success]="Welcome to StoreNav! You are a member now!"       #if object is saved successfully, eg validations pass
        redirect_to @user
      else                    
        #if object is not saved successfully, redirect to new action
        render 'new'
      end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

end
