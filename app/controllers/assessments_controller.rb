class AssessmentsController < ApplicationController
  def index

  end
    
  def new 
    @assessment = Assessment.new

    respond_to do |format|
      format.html #new.html.haml
      format.json { render json: @assessment }
    end
  end

  def create
    @assessment = Assessment.new(params[:assessment])

    respond_to do |format|
      if @assessment.save
        format.html{ redirect_to @assessment.goal, notice: 'Assessment recorded successfully.' }
        format.json{ render json:@assessment, status: :created, location: @assessment }
      end
    end
  end
end
