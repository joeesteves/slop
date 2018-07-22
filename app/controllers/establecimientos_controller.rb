class EstablecimientosController < ApplicationController
  before_action :set_establecimiento, only: [:show, :edit, :update, :destroy]

  # GET /establecimientos
  def index
    @establecimientos = @current_user.establecimientos.where("permiso = 1")
  end

  # GET /establecimientos/1
  def show
  end

  # GET /establecimientos/new
  def new
    @establecimiento = Establecimiento.new
    @usuarios = User.all
    
  end

  # GET /establecimientos/1/edit
  def edit
  	
  	@establecimiento = Establecimiento.find(params[:id])
  	@sel = @establecimiento.user_ids
  	@usuarios = User.all
  	
  end

  # POST /establecimientos
  def create
    @establecimiento = Establecimiento.new(establecimiento_params)
    @establecimiento.update_attributes(:user_ids => @current_user.id)

    if @establecimiento.save
      redirect_to @establecimiento, notice: 'Establecimiento was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /establecimientos/1
  def update
    if @establecimiento.update(establecimiento_params)
    	    @establecimiento.update_attributes(:user_ids => params[:users])
      redirect_to @establecimiento, notice: 'Establecimiento was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /establecimientos/1
  def destroy
    @establecimiento.destroy
    redirect_to establecimientos_url, notice: 'Establecimiento was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_establecimiento
      @establecimiento = Establecimiento.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def establecimiento_params
      params.require(:establecimiento).permit(:codigo, :nombre, :clima)
    end
end
