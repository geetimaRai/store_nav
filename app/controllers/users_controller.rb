class UsersController < ApplicationController

  before_filter :signed_in_user, only: [:index, :edit, :update]
  before_filter :correct_user, only: [:edit, :update]

  def new
  	@user=User.new
  end

  def index
  	@users = User.paginate(page: params[:page])
  end

  def show
  	@user=User.find(params[:id])
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    if @user.update_attributes(params[:user])   
        flash[:success] = "Profile updated"
        sign_in @user
        redirect_to @user
      else                    
        #if object is not saved successfully, redirect to new action
        render 'edit'
      end
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

def signed_in_user
    unless signed_in?
      store_location
redirect_to signin_path, notice: "Please sign in." 
end
end

def correct_user
@user = User.find(params[:id])
redirect_to(root_path) unless current_user?(@user)
end

end
