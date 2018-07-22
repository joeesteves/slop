class RodeosController < ApplicationController
  # GET /rodeos
  # GET /rodeos.json
  def index
    @rodeos = Rodeo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rodeos }
    end
  end

  # GET /rodeos/1
  # GET /rodeos/1.json
  def show
    @rodeo = Rodeo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rodeo }
    end
  end

  # GET /rodeos/new
  # GET /rodeos/new.json
  def new
    @rodeo = Rodeo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rodeo }
    end
  end

  # GET /rodeos/1/edit
  def edit
    @rodeo = Rodeo.find(params[:id])
  end

  # POST /rodeos
  # POST /rodeos.json
  def create
    @rodeo = Rodeo.new(params[:rodeo])

    respond_to do |format|
      if @rodeo.save
        format.html { redirect_to rodeos_path, notice: 'Rodeo was successfully created.' }
        format.json { render json: @rodeo, status: :created, location: @rodeo }
      else
        format.html { render action: "new" }
        format.json { render json: @rodeo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rodeos/1
  # PUT /rodeos/1.json
  def update
    @rodeo = Rodeo.find(params[:id])

    respond_to do |format|
      if @rodeo.update_attributes(params[:rodeo])
        format.html { redirect_to @rodeo, notice: 'Rodeo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rodeo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rodeos/1
  # DELETE /rodeos/1.json
  def destroy
    @rodeo = Rodeo.find(params[:id])
    @rodeo.destroy

    respond_to do |format|
      format.html { redirect_to rodeos_url }
      format.json { head :no_content }
    end
  end
end
