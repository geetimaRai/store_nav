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
	respond_to do |format|
      if @user.save           #if object is saved successfully, eg validations pass
        format.html { redirect_to @user, notice: 'Welcome to StoreNav. You are a member now!' }
        format.json { render action: 'show', status: :created, location: @user }
      else                    
        #if object is not saved successfully, redirect to new action
        format.html { render action: 'new' }    #all filled fields will be prepopulated
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
