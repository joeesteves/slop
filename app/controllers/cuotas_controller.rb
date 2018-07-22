class CuotasController < ApplicationController
  before_action :set_cuota, only: [:show, :edit, :update, :destroy]

  # GET /cuotas
  def index
    @cuotas = Cuota.sesionActual(session[:empresa_id])
  end

  # GET /cuotas/1
  def show
  end

  # GET /cuotas/new
  def new
    @cuota = Cuota.new
  end

  # GET /cuotas/1/edit
  def edit
  end

  # POST /cuotas
  def create
    @cuota = Cuota.new(cuota_params)

    if @cuota.save
      redirect_to @cuota, notice: 'Cuota was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /cuotas/1
  def update
    if @cuota.update(cuota_params)
      redirect_to @cuota, notice: 'Cuota was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /cuotas/1
  def destroy
    @cuota.destroy
    redirect_to cuotas_url, notice: 'Cuota was successfully destroyed.'
  end

	def importe
		@importe = 0;
		
		unless params[:cuotas].empty?
			@cuotas = Cuota.find(params[:cuotas])
			cuotasId = @cuotas.collect(&:id)
			ap = Aplicacion.where(:cuota6 => cuotasId).sum(:importe, :group=>:cuota6)
			@cuotas.each do |c|
				unless ap[c.id].nil?
					@importe = @importe + c.importe - ap[c.id]
				else
					@importe = @importe + c.importe
				end			
			end
		end
		respond_to do |format|
			format.js {}
		end
	end

	def buscaCuotas
		tipos = Transacciontipo.find(params[:transacciontipo_id]).codigo
				
		@cuotasPendientes = Cuota.pendientes(tipos,params[:ctaD],params[:ctaH],session[:empresa_id])
		cuotasId = @cuotasPendientes.collect(&:id)
		@ap = Aplicacion.where(:cuota6 => cuotasId).sum(:importe, :group=>:cuota6)

		@cuotasPendientes9 = Cuota.pendientes9(tipos,params[:ctaD],params[:ctaH],session[:empresa_id])
		cuotas9Id = @cuotasPendientes9.collect(&:id)
		@ap9 = Aplicacion.where(:cuota9 => cuotas9Id).sum(:importe, :group=>:cuota9)

		unless params[:esCierre] == "1"
			render "buscaCuotas.js.erb"
		else 
			render "buscaCuotasCierre.js.erb"
		end
	end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cuota
      @cuota = Cuota.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cuota_params
      params.require(:cuota).permit(:fecha, :cuota, :importe, :transaccion_id)
    end
end

