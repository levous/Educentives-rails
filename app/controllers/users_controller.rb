class UsersController < ApplicationController
  
  skip_before_filter :require_login
  
  def new
    @user = User.new
  end
  
  def create 
    @user = User.new(params[:user])
    @person = Person.new(:title => 'test')
    @user.person = @person
    if(@user.save)
      user = login(@user.username, params[:user][:password], rememberme = false)
      redirect_to root_url, :notice => "Signed Up!" 
    else
      render :new
    end
  end
  

end
