class SessionsController < ApplicationController
  
  skip_before_filter :require_login, :only => [:new, :create]
  
  def new
  end
  
  def create
    
    user = login(params[:username], params[:password], params[:remember_me])
    if user
      redirect_back_or_to root_url, :notice => "Logged in!" 
    else
      flash.now.alert = "Username or password was invalid"
      render :new
    end
    
  end

  def destroy
    logout
    redirect_to root_url, :notice => "Logged Out!"
  end
  
end
