class MediciontiposController < ApplicationController
  before_action :set_mediciontipo, only: [:show, :edit, :update, :destroy]

  # GET /mediciontipos
  def index
    @mediciontipos = Mediciontipo.all
  end

  # GET /mediciontipos/1
  def show
  end

  # GET /mediciontipos/new
  def new
    @mediciontipo = Mediciontipo.new
  end

  # GET /mediciontipos/1/edit
  def edit
  end

  # POST /mediciontipos
  def create
    @mediciontipo = Mediciontipo.new(mediciontipo_params)

    if @mediciontipo.save
      redirect_to @mediciontipo, notice: 'Mediciontipo was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /mediciontipos/1
  def update
    if @mediciontipo.update(mediciontipo_params)
      redirect_to @mediciontipo, notice: 'Mediciontipo was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /mediciontipos/1
  def destroy
    @mediciontipo.destroy
    redirect_to mediciontipos_url, notice: 'Mediciontipo was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mediciontipo
      @mediciontipo = Mediciontipo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def mediciontipo_params
      params.require(:mediciontipo).permit(:codigo, :nombre)
    end
end
