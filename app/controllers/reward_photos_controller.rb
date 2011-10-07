class RewardPhotosController < ApplicationController
  # GET /reward_photos
  # GET /reward_photos.json
  def index
    @reward_photos = RewardPhoto.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reward_photos }
    end
  end

  # GET /reward_photos/1
  # GET /reward_photos/1.json
  def show
    @reward_photo = RewardPhoto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reward_photo }
    end
  end

  # GET /reward_photos/new
  # GET /reward_photos/new.json
  def new
    @reward_photo = RewardPhoto.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reward_photo }
    end
  end

  # GET /reward_photos/1/edit
  def edit
    @reward_photo = RewardPhoto.find(params[:id])
  end

  # POST /reward_photos
  # POST /reward_photos.json
  def create
    @reward_photo = RewardPhoto.new(params[:reward_photo])

    respond_to do |format|
      if @reward_photo.save
        format.html { redirect_to @reward_photo, notice: 'Reward photo was successfully created.' }
        format.json { render json: @reward_photo, status: :created, location: @reward_photo }
      else
        format.html { render action: "new" }
        format.json { render json: @reward_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reward_photos/1
  # PUT /reward_photos/1.json
  def update
    @reward_photo = RewardPhoto.find(params[:id])

    respond_to do |format|
      if @reward_photo.update_attributes(params[:reward_photo])
        format.html { redirect_to @reward_photo, notice: 'Reward photo was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @reward_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reward_photos/1
  # DELETE /reward_photos/1.json
  def destroy
    @reward_photo = RewardPhoto.find(params[:id])
    @reward_photo.destroy

    respond_to do |format|
      format.html { redirect_to reward_photos_url }
      format.json { head :ok }
    end
  end
end
