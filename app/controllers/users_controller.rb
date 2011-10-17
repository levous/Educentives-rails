class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create 
    @user = User.new(params[:user])
    
    if(@user.save)
      #not working... login(@user.username, @user.password, rememberme = false)
      redirect_to root_url, :notice => "Signed Up! (please log in)"
    else
      render :new
    end
  end
  

end
