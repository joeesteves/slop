class MedicionesController < ApplicationController
  before_action :set_medicion, only: [:show, :edit, :update, :destroy]

  # GET /mediciones
  def index
    @mediciones = Medicion.all
  end

  # GET /mediciones/1
  def show
  end

  # GET /mediciones/new
  def new
    @medicion = Medicion.new
  end

  # GET /mediciones/1/edit
  def edit
  end

  # POST /mediciones
  def create
    @medicion = Medicion.new(medicion_params)

    if @medicion.save
      redirect_to @medicion, notice: 'Medicion was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /mediciones/1
  def update
    if @medicion.update(medicion_params)
      redirect_to @medicion, notice: 'Medicion was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /mediciones/1
  def destroy
    @medicion.destroy
    redirect_to mediciones_url, notice: 'Medicion was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medicion
      @medicion = Medicion.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def medicion_params
      params.require(:medicion).permit(:fecha, :peso, :adpv, :adpvna, :ce, :mediciontipo_id)
    end
end
