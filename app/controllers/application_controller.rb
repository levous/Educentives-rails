class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :require_login, :except => [:not_autheticated]
  
  private
  
  def not_authenticated
    redirect_to login_url, :alert => "Please login to access this page"
  end
  
end
