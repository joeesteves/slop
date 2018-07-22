class MonedasController < ApplicationController
  before_action :set_moneda, only: [:show, :edit, :update, :destroy]

  # GET /monedas
  def index
    @monedas = Moneda.all
  end

  # GET /monedas/1
  def show
  end

  # GET /monedas/new
  def new
    @moneda = Moneda.new
  end

  # GET /monedas/1/edit
  def edit
  end

  # POST /monedas
  def create
    @moneda = Moneda.new(moneda_params)

    if @moneda.save
      redirect_to @moneda, notice: 'Moneda was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /monedas/1
  def update
    if @moneda.update(moneda_params)
      redirect_to @moneda, notice: 'Moneda was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /monedas/1
  def destroy
    @moneda.destroy
    redirect_to monedas_url, notice: 'Moneda was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_moneda
      @moneda = Moneda.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def moneda_params
      params.require(:moneda).permit(:codigo, :nombre)
    end
end
