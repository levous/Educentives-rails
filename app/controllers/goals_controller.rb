class GoalsController < ApplicationController

  respond_to :html, :js, :json
  # GET /goals
  # GET /goals.json
  def index

    @goals = Goal.by_person_as_student(current_user.person)
    @goals = @goals.by_plan(params[:plan_id]) if params[:plan_id].present?

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @goals }
    end
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
    @goal = Goal.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @goal }
    end
  end

  # GET /goals/new
  # GET /goals/wizard
  # GET /goals/new.json
  def new
    @goal = Goal.new
    current_uri = request.env['PATH_INFO']
    
    if current_uri == goal_wizard_path
      render :wizard
    else

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @goal }
      end
    end
  end

  # GET /goals/1/edit
  def edit
    @goal = Goal.find(params[:id])
  end

  # POST /goals
  # POST /goals.json
  def create
    @goal = Goal.new(params[:goal])
    @goal.set_goal_user current_user

    # on the wizard path, steps guarantee that this goal preceeds the plan and reward.  Create empty objects for next step.
    is_wizard = (params[:user_context] == 'wizard')

    respond_to do |format|
      if @goal.save
        if is_wizard 
          @reward = @goal.plan.reward
          puts "reward #{@reward}"
          format.html { render action: "wizard_prize" }
        else
          format.html { redirect_to @goal, notice: 'Goal was successfully created.' }
        end
        format.json { render json: @goal, status: :created, location: @goal }
      else
        format.html { render action: "new" }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /goals/1
  # PUT /goals/1.json
  def update
    @goal = Goal.find(params[:id])

    respond_to do |format|
      if @goal.update_attributes(params[:goal])
        format.html { redirect_to @goal, notice: 'Goal was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy

    respond_to do |format|
      format.html { redirect_to goals_url }
      format.json { head :ok }
    end
  end

  def progress
    @goal = Goal.find(params[:id])
    respond_with @assessment_scores, @goal
  end
end
