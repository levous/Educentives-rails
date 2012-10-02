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
    
    flash[:notice] = "Successfully recorded score of #{params[:assessment][:score]}"

    respond_to do |format|
      if @assessment.save
        format.html{ redirect_to @assessment.goal, notice: 'Assessment recorded successfully.' }
        format.json{ render json:@assessment, status: :created, location: @assessment }
        format.js # create.js.haml
      else
        format.html { render action: "new" }
        format.json { render json: @milestone.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def progresChart

  end
end
