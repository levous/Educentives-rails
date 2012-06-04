class HomeController < ApplicationController
  
  skip_before_filter :require_login 
  
  def index
    @goals = Goal.by_person_as_student(current_user.person) if current_user && current_user.person
  end
  
  def about
  end

end
