class UsersController < ApplicationController
 skip_before_action :authenticate_user, only: [:sign_in, :signup, :new, :create]
  def index
  	@users=User.all
  end

  def new
  	@user=User.new
      @user.build_image
  end
  def create
  	@user=User.new(user_params)
  	if @user.save
  	redirect_to users_path
  	else
  		render :new
  	end
  end
  def edit
      @user = User.find params[:id]
  end
def update
    @user = User.find params[:id]
    if @user.update(user_params)
       redirect_to users_path
       else
       render :edit 
    end
  end 
  def show
    @user = User.find params[:id]
  end
def destroy 
     @user = User.find params[:id]
     @user.destroy
     redirect_to users_path
  end
  def signup
      @user = User.authenticate(params[:email], params[:password])
      if @user
          session[:user_id] = @user.id
          redirect_to products_path
        else
          redirect_to sign_in_users_path
      end
  end
  def logout
    session[:user_id] = nil
    redirect_to sign_in_users_path
  end
private
def user_params
	params.require(:user).permit!
end
end
