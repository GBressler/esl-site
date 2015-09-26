class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_action :set_locale = es
 
#def set_locale
 # I18n.locale = params[:locale] || I18n.default_locale
#end

  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  rescue_from CanCan::AccessDenied do |exception|
    if current_user.nil?
      session[:next] = request.fullpath
      redirect_to login_url, :alert => "Please login to continue."
    else
      if request.env["HTTP_REFERER"].PRESENT?
        redirect_to :back, :alert => exception.message
      else
        render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
      end
    end
  end

#def default_url_options(options = {})
 # { locale: I18n.locale }.merge options
#end
    protected
 
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_in) do |u|
        u.permit(:email, :username)
      end
      devise_parameter_sanitizer.for(:sign_up) do |u|
        u.permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
      end
      devise_parameter_sanitizer.for(:account_update) do |u|
        u.permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :current_password)
      end
    end
end
