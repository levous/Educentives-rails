class HomeController < ApplicationController
  
  skip_before_filter :require_login 
  
  def index
    # @goals = Goal.all
    
  end
  
  def about
  end

end
