class CotizacionesController < ApplicationController
  before_action :set_cotizacion, only: [:show, :edit, :update, :destroy]

  # GET /cotizaciones
  def index
    @cotizaciones = Cotizacion.all
  end

  # GET /cotizaciones/1
  def show
  end

  # GET /cotizaciones/new
  def new
    @cotizacion = Cotizacion.new
  end

  # GET /cotizaciones/1/edit
  def edit
  end

  # POST /cotizaciones
  def create
    @cotizacion = Cotizacion.new(cotizacion_params)

    if @cotizacion.save
      redirect_to @cotizacion, notice: 'Cotizacion was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /cotizaciones/1
  def update
    if @cotizacion.update(cotizacion_params)
      redirect_to @cotizacion, notice: 'Cotizacion was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /cotizaciones/1
  def destroy
    @cotizacion.destroy
    redirect_to cotizaciones_url, notice: 'Cotizacion was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cotizacion
      @cotizacion = Cotizacion.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cotizacion_params
      params.require(:cotizacion).permit(:fecha, :cotizacion, :moneda_id)
    end
end
