class MilestonesController < ApplicationController
  # GET /milestones
  # GET /milestones.json
  def index
    @milestones = Milestone.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @milestones }
    end
  end

  # GET /milestones/1
  # GET /milestones/1.json
  def show
    @milestone = Milestone.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @milestone }
    end
  end

  # GET /milestones/new
  # GET /milestones/new.json
  def new
    @milestone = Milestone.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @milestone }
    end
  end

  # GET /milestones/1/edit
  def edit
    @milestone = Milestone.find(params[:id])
  end

  # POST /milestones
  # POST /milestones.json
  def create
    @milestone = Milestone.new(params[:milestone])

    if(@milestone.goal_id)
      goal = Goal.find(@milestone.goal_id)
      if goal.milestones.count > 1
        @milestone.position = goal.milestones.maximum(:position) + 1
      else
        @milestone.position = 1
      end
    end 
    # @goal = Goal.find(params[:goal_id])
    # redirect_to post_path(@goal)
    flash[:notice] = "Successfully created milestone."
    respond_to do |format|
      if @milestone.save
         format.html { redirect_to @milestone, notice: 'Milestone was successfully created.' }
         format.json { render json: @milestone, status: :created, location: @milestone }
         format.js # return create.js.erb
       else
         format.html { render action: "new" }
         format.json { render json: @milestone.errors, status: :unprocessable_entity }
       end
    end
  end

  def sort
    params[:milestone].each_with_index do |id, index|
      Milestone.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end

  # PUT /milestones/1
  # PUT /milestones/1.json
  def update
    @milestone = Milestone.find(params[:id])

    respond_to do |format|
      if @milestone.update_attributes(params[:milestone])
        format.html { redirect_to @milestone, notice: 'Milestone was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @milestone.errors, status: :unprocessable_entity }
      end
    end
  end

  def complete
    @milestone = Milestone.find(params[:id])
    @milestone.completed_at = DateTime.now
    @milestone.save
    @milestone.goal.save

    flash[:notice] = "Successfully completed milestone."
    respond_to do |format|
      format.html { redirect_to @milestone, notice: 'Milestone completed.' }
      format.json { head :ok }
      format.js
    end
  end
  
  # DELETE /milestones/1
  # DELETE /milestones/1.json
  def destroy
    @milestone = Milestone.find(params[:id])
    @milestone.destroy

    respond_to do |format|
      format.html { redirect_to milestones_url }
      format.json { head :ok }
    end
  end
end
