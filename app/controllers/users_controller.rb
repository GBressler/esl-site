class UsersController < ApplicationController
  #before_filter load_and_authorize_resource :user
    #before_action :authenticate_user!
  #before_action :set_user,
load_and_authorize_resource param_method: :user_params, only: [:show, :edit, :update, :destroy]


  def index

  	if current_user.id == 1
    	@users = User.all
   	else
   		render 'profile_page'
   	end
  end

  def show
    authorize! :show, current_user
    #@user.user_params[:id]
  	#@user = User.user_params[:id]
  	#authorize! :show, @user
    #@users = User.all

    #with this commented out I get access to the pages, 
    #but the erb isn't working & no sign out --looks like user isn't assigned
  	#@user = User.find(params[:id])
  	#current_user.first_name
    render 'profile_page'
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
