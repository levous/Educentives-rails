class HomeController < ApplicationController
  def index
    @goals = Goal.all
  end
  
  def about
  end

end
