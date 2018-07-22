class CatfiscalesController < ApplicationController
  before_action :set_catfiscal, only: [:show, :edit, :update, :destroy]

  # GET /catfiscales
  def index
    @catfiscales = Catfiscal.all
  end

  # GET /catfiscales/1
  def show
  end

  # GET /catfiscales/new
  def new
    @catfiscal = Catfiscal.new
  end

  # GET /catfiscales/1/edit
  def edit
  end

  # POST /catfiscales
  def create
    @catfiscal = Catfiscal.new(catfiscal_params)

    if @catfiscal.save
      redirect_to @catfiscal, notice: 'Catfiscal was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /catfiscales/1
  def update
    if @catfiscal.update(catfiscal_params)
      redirect_to @catfiscal, notice: 'Catfiscal was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /catfiscales/1
  def destroy
    @catfiscal.destroy
    redirect_to catfiscales_url, notice: 'Catfiscal was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catfiscal
      @catfiscal = Catfiscal.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def catfiscal_params
      params.require(:catfiscal).permit(:codigo, :nombre, :iva)
    end
end
