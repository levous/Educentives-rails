class RewardsController < ApplicationController
  # GET /rewards
  # GET /rewards.json
  def index
    @rewards = Reward.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rewards }
    end
  end

  # GET /rewards/1
  # GET /rewards/1.json
  def show
    @reward = Reward.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reward }
    end
  end

  # GET /rewards/new
  # GET /rewards/new.json
  def new
    @reward = Reward.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reward }
    end
  end

  # GET /rewards/1/edit
  def edit
    @reward = Reward.find(params[:id])
    #@reward.reward_photo = RewardPhoto.new unless @reward.reward_photo.present?

  end

  # POST /rewards
  # POST /rewards.json
  def create

    @reward = Reward.new(params[:reward])

    respond_to do |format|
      if @reward.save
        format.html { redirect_to @reward, notice: 'Reward was successfully created.' }
        format.json { render json: @reward, status: :created, location: @reward }
      else
        format.html { render action: "new" }
        format.json { render json: @reward.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rewards/1
  # PUT /rewards/1.json
  def update
    @reward = Reward.find(params[:id])
    is_wizard = (params[:user_context] == 'wizard')

    respond_to do |format|
      if @reward.update_attributes(params[:reward])
        if is_wizard
          format.html { redirect_to @reward.plan.goal, notice: 'Congratulations, you\'ve set up a Goal. Start adding Milestonesi, below, to establish incremental steps toward reaching your goal.'}
          w
        else
          format.html { redirect_to @reward, notice: 'Reward was successfully updated.' }
          format.json { head :ok }
        end
      else
        format.html { render action: "edit" }
        format.json { render json: @reward.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rewards/1
  # DELETE /rewards/1.json
  def destroy
    @reward = Reward.find(params[:id])
    @reward.destroy

    respond_to do |format|
      format.html { redirect_to rewards_url }
      format.json { head :ok }
    end
  end
end
