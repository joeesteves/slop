class CuentasController < ApplicationController
  before_action :set_cuenta, only: [:show, :edit, :update, :destroy]

  # GET /cuentas
  def index
    @cuentas = Cuenta.sesionActual(session[:empresa_id]).order('codigo asc')
  end
  

  # GET /cuentas/1
  def show
  end

  # GET /cuentas/new
  def new
    @cuenta = Cuenta.new
  end

  # GET /cuentas/1/edit
  def edit
  	@cuenta = Cuenta.find(params[:id])
  end

  # POST /cuentas
  def create
    @cuenta = Cuenta.new(cuenta_params)
		@cuenta.empresa_id = @current_emp.id

    if @cuenta.save
      redirect_to @cuenta, notice: 'Cuenta was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /cuentas/1
  def update
    if @cuenta.update(cuenta_params)
      redirect_to @cuenta, notice: 'Cuenta was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /cuentas/1
  def destroy
    @cuenta.destroy
    redirect_to cuentas_url, notice: 'Cuenta was successfully destroyed.'
  end
	
	def filtraPorTipos
		tipo = Transacciontipo.find(params[:transaccion_id]).codigo

		case tipo
			when 0
				@ctasD = Cuenta.sesionActual(session[:empresa_id]).where('tipo != 0')
				@ctasH = Cuenta.sesionActual(session[:empresa_id]).where('tipo != 0')
			when 1
				@ctasD = Cuenta.tipos([1,2],session[:empresa_id])
				@ctasH = Cuenta.tipos([6],session[:empresa_id])			 
			when 2
				@ctasD = Cuenta.tipos([7],session[:empresa_id])
				@ctasH = Cuenta.tipos([1,3],session[:empresa_id])
			when 3
				@ctasD = Cuenta.tipos([1,2],session[:empresa_id])
				@ctasH = Cuenta.tipos([2],session[:empresa_id])
			when 4
				@ctasD = Cuenta.tipos([3],session[:empresa_id])
				@ctasH = Cuenta.tipos([1,3],session[:empresa_id])
		end
	
		respond_to do |format|
			format.js {}
		end
	
	end
	
	def importar
		Cuenta.importar(params[:file])
		
	redirect_to cuentas_url, notice: "se han importado las cuentas correctamente"
	
	end
	
	




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cuenta
      @cuenta = Cuenta.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cuenta_params
      params.require(:cuenta).permit(:codigo, :nombre, :tipo, :cierre)
    end
end
