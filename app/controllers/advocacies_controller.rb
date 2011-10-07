class AdvocaciesController < ApplicationController
  # GET /advocacies
  # GET /advocacies.json
  def index
    @advocacies = Advocacy.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @advocacies }
    end
  end

  # GET /advocacies/1
  # GET /advocacies/1.json
  def show
    @advocacy = Advocacy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @advocacy }
    end
  end

  # GET /advocacies/new
  # GET /advocacies/new.json
  def new
    @advocacy = Advocacy.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @advocacy }
    end
  end

  # GET /advocacies/1/edit
  def edit
    @advocacy = Advocacy.find(params[:id])
  end

  # POST /advocacies
  # POST /advocacies.json
  def create
    @advocacy = Advocacy.new(params[:advocacy])

    respond_to do |format|
      if @advocacy.save
        format.html { redirect_to @advocacy, notice: 'Advocacy was successfully created.' }
        format.json { render json: @advocacy, status: :created, location: @advocacy }
      else
        format.html { render action: "new" }
        format.json { render json: @advocacy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /advocacies/1
  # PUT /advocacies/1.json
  def update
    @advocacy = Advocacy.find(params[:id])

    respond_to do |format|
      if @advocacy.update_attributes(params[:advocacy])
        format.html { redirect_to @advocacy, notice: 'Advocacy was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @advocacy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /advocacies/1
  # DELETE /advocacies/1.json
  def destroy
    @advocacy = Advocacy.find(params[:id])
    @advocacy.destroy

    respond_to do |format|
      format.html { redirect_to advocacies_url }
      format.json { head :ok }
    end
  end
end
