class UsersController < ApplicationController
  def new
  	@user = User.new
  end
  def show
    @user = User.find(params[:id])
    
  end

   def create
    # @user = User.new(params[:user])    # Not the final implementation!
    @user = User.new(user_params)
    if @user.save
    	@user1 = User.last.name
    	log_in @user
        flash[:success] = "Welcome to the Sample App! Hello #{@user1}"
        redirect_to @user
      # Handle a successful save.
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
