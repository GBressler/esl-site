class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
  	if current_user.id == 1
    	@users = User.all
   	else
   		render 'profile_page'
   	end
  end

  def show
  	render 'profile_page'
  	authorize! :show, @user
  	@user = User.find(params[:id])
  	current_user.first_name
  end

  def update
  end
  
  def edit
  	authorize! :edit, @user
  end

  def destroy
  	
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
     @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
     params.require(:user).permit(:id, :first_name, :last_name, :email, :username)
    end

    #consider commenting out show method and the private methods
end
