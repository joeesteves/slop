class EmpresasController < ApplicationController
  before_action :set_empresa, only: [:show, :edit, :update, :destroy]

  # GET /empresas
  def index
    @empresas = @current_user.empresas.where("permiso = 1")
  end

  # GET /empresas/1
  def show
  end

  # GET /empresas/new
  def new
    @empresa = Empresa.new
   	@usuarios = User.all
  end

  # GET /empresas/1/edit
  def edit
  
  	@sel = @empresa.user_ids
  	@usuarios = User.all
  	
  end

  # POST /empresas
  def create
    @empresa = Empresa.new(empresa_params)
		@empresa.update_attributes(:user_ids => @current_user.id)
    
    if @empresa.save
      redirect_to empresas_path, notice: 'Empresa was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /empresas/1
  def update
    if @empresa.update(empresa_params)
  	    @empresa.update_attributes(:user_ids => params[:users])
      redirect_to @empresa, notice: 'Empresa was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /empresas/1
  def destroy
    @empresa.destroy
    redirect_to empresas_url, notice: 'Empresa was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empresa
      @empresa = Empresa.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def empresa_params
      params.require(:empresa).permit(:codigo, :nombre, :catfiscal_id, :ctaivacompras, :ctaivaventas)
    end
end
