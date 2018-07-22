class AsientosController < ApplicationController
  before_action :set_asiento, only: [:show, :edit, :update, :destroy]

  # GET /asientos
  def index

		unless params[:desde].nil? || params[:hasta].nil?
			@desde = params[:desde]
			@hasta = params[:hasta]
			@cuentas = params[:cuentas]
			@asientos = Asiento.sesionActual(session[:empresa_id]).where('fecha >= ? AND fecha <= ?', params[:desde], params[:hasta]).order('cuenta_id asc , fecha asc')
			@asientos = @asientos.where(:cuenta_id => params[:cuentas]) unless params[:cuentas].nil?

		else
			@desde = Date.new(Date.today.year, Date.today.month,1)
			@hasta = Date.new(Date.today.year, Date.today.month,-1)
			@asientos = Asiento.sesionActual(session[:empresa_id]).where('fecha >= ? AND fecha <= ?', @desde, @hasta).order('cuenta_id asc, fecha asc')
		end
		@saldo = Array.new
		saldo = 0
		cuenta_id = @asientos.first().cuenta_id rescue nil
		@saldoGlobal = Hash.new
		
		@asientos.each do |a|
			if cuenta_id != a.cuenta_id
				saldo = 0
			end
			saldo += a.debe.to_f - a.haber.to_f
			@saldo[a.id] = saldo.round(2) 
			cuenta_id = a.cuenta_id
			@saldoGlobal[a.cuenta_id] = saldo.round(2)
		end
	end
	
	def eerr

			unless params[:desde].nil? || params[:hasta].nil?
				@desde = params[:desde]
				@hasta = params[:hasta]
				@cuentas = params[:cuentas]
				@asientos = Asiento.sesionActual(session[:empresa_id]).where('fecha >= ? AND fecha <= ?', params[:desde], params[:hasta]).order('cuenta_id asc , fecha asc').where(:cuenta_id => Cuenta.tipos([6,7], session[:empresa_id]))

				@asientos = @asientos.where(:cuenta_id => params[:cuentas]) unless params[:cuentas].nil?
			else
				@desde = Date.new(Date.today.year, Date.today.month,1)
				@hasta = Date.new(Date.today.year, Date.today.month,-1)
				@asientos = Asiento.sesionActual(session[:empresa_id]).where('fecha >= ? AND fecha <= ?', @desde, @hasta).order('cuenta_id asc, fecha asc').where(:cuenta_id => Cuenta.tipos([6,7], session[:empresa_id]))
			end
			@saldo = Array.new
			saldo = 0
			cuenta_id = @asientos.first().cuenta_id rescue nil
			@saldoGlobal = Hash.new
		
			@asientos.each do |a|
				if cuenta_id != a.cuenta_id
					saldo = 0
				end
				saldo += (a.debe.to_f - a.haber.to_f) * -1
				@saldo[a.id] = saldo.round(2) 
				cuenta_id = a.cuenta_id
				@saldoGlobal[a.cuenta_id] = saldo.round(2)
			end
		end
	
# GET /asientos/1
	def show
	end

	# GET /asientos/new
	def new
		@asiento = Asiento.new
	end

	# GET /asientos/1/edit
	def edit
	end

	# POST /asientos
	def create
		@asiento = Asiento.new(asiento_params)

		if @asiento.save
			redirect_to @asiento, notice: 'Asiento was successfully created.'
		else
			render action: 'new'
		end
	end

	# PATCH/PUT /asientos/1
	def update
		if @asiento.update(asiento_params)
			redirect_to @asiento, notice: 'Asiento was successfully updated.'
		else
			render action: 'edit'
		end
	end

	# DELETE /asientos/1
	def destroy
		@asiento.destroy
		redirect_to asientos_url, notice: 'Asiento was successfully destroyed.'
	end

	def cashflow
		empresa = session[:empresa_id]
		hoy = Date.today()
		@rep = 12 
		fin = hoy.advance(:months => @rep - 1) 
		hasta = Date.new(fin.year,fin.month, -1)
		@CtasInicio = Cuenta.conSaldo([1,2,3],hoy,empresa)
		@CtasFin = Cuenta.conSaldo([1,2,3],hasta,empresa)
		@ctasDisp = @CtasInicio | @CtasFin
		ctasDispId = @ctasDisp.collect(&:id)
		@sDI = Asiento.saldoCta(ctasDispId,hoy,empresa) # saldos iniciales
		sDI = Array.new()
		@sDI.each {|k,v| sDI.push(v)}
		@sDITotal = sDI.sum

		@sDF = Asiento.saldoCta(ctasDispId,hasta,empresa) # saldos finales 
		sDF = Array.new()
		@sDF.each {|k,v| sDF.push(v)}
		@sDFTotal = sDF.sum
		@sMes = Array.new	
		@sMesTotales = Array.new
		@rep.times do |t|
			sMes = Array.new
			if t == 0
				@sMes[t] = Asiento.saldoPeriodoCta(ctasDispId,hoy,Date.new(hoy.year,hoy.month,-1),empresa)
			else	
				@sMes[t] = Asiento.saldoMesCta(ctasDispId,hoy.advance(:months => t),empresa)
			end
			@sMes[t].each {|k,v| sMes.push(v)} 
			@sMesTotales[t] = sMes.sum

		end
		@meses = ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre']
		respond_to do |format|
			format.html

		end


	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_asiento
		@asiento = Asiento.find(params[:id])
	end

	# Only allow a trusted parameter "white list" through.
	def asiento_params
		params.require(:asiento).permit(:fecha, :debe, :haber, :cuenta_id, :transaccion_id, :cuota_id)
	end
end
