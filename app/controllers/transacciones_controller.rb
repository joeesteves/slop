class TransaccionesController < ApplicationController
  before_action :set_transaccion, only: [:show, :edit, :update, :destroy]

  # GET /transacciones
  def index
    @transacciones = Transaccion.sesionActual(session[:empresa_id]).order('id desc')
  end

  # GET /transacciones/1
  def show
  end

  # GET /transacciones/new
  def new
		@transaccion = Transaccion.new
    @transaccion.fecha = Date.today
    @transaccion.cuotascantidad = 1
    @transaccion.transacciontipo_id = Transacciontipo.idxcod(2)   
	  @transaccion.civa = @current_emp.catfiscal.try(:iva)
   	@tipo = @transaccion.transacciontipo.codigo
    filtraPorTipos(@tipo)
  end
  
	# GET /transacciones/1/edit
  def edit
  	@transaccion = Transaccion.find(params[:id])
  	@cApp = @transaccion.aplicaciones9.collect(&:cuota6)
  	@tipo = @transaccion.transacciontipo.codigo
  	@ctasDS = @transaccion.ctaD_id
  	@ctasDH = @transaccion.ctaH_id
		filtraPorTipos(@tipo)
		unless  @cApp.empty?
	  	@cuotas = Cuota.pendientes(@tipo, @transaccion.ctaD_id, @transaccion.ctaH_id, session[:empresa_id]) | Cuota.find(@cApp)
		else 
	  	@cuotas = Cuota.pendientes(@tipo, @transaccion.ctaD_id, @transaccion.ctaH_id, session[:empresa_id])
		end
  end	

  # POST /transacciones
  def create
    @transaccion = Transaccion.new(params[:transaccion])
		@transaccion.empresa_id = session[:empresa_id]
   	t = @transaccion
   	@tcod = t.transacciontipo.codigo
    
		if t.save
			creaDerivados(t, @tcod)
      redirect_to new_transaccion_path
    else
      render action: 'new'
    end
    
  end

  # PATCH/PUT /transacciones/1
  def update
 		t = @transaccion
   	@tcod = t.transacciontipo.codigo

		if t.update(params[:transaccion])
			creaDerivados(t, @tcod)		
      redirect_to transacciones_url
    else
      redirect_to edit_transaccion_path, notice: 'LA TRANSACCION SE ENCUENTRA APLICAD ENCUENTRA APLICADA'
    end
  end
	
	
	def creaDerivados(t, tcod)

		case tcod
		when 1 # ingresos
			if evCtaCte(t.ctaD_id) # es cuenta corriente
				crearCuotas(t,6)
				crearAsientos(t,tcod,t.rmensuales)
			else
				crearAsientos(t,tcod,false)
			end		 
		when 2 # egresos
			if evCtaCte(t.ctaH_id) # es cuenta corriente
				crearCuotas(t,6)
				crearAsientos(t,tcod,t.rmensuales)
			else
				crearAsientos(t,tcod,false)
			end	
		when 3 # cobranzas
			if evCtaCte(t.ctaD_id) # es cuenta corriente
				crearCuotas(t,6)
				crearAsientos(t,tcod,false)
				crearCuotas(t,9)
				aplicaCuotas(t.cuota9,params[:aplicaciones])
			else
				crearAsientos(t,tcod,false)
				crearCuotas(t,9)
				aplicaCuotas(t.cuota9,params[:aplicaciones])
			end
		when 4 # pagos
			if evCtaCte(t.ctaH_id) # es cuenta corriente
				crearCuotas(t,6)
				crearAsientos(t,tcod,false)
				crearCuotas(t,9)
				aplicaCuotas(t.cuota9,params[:aplicaciones])
			else
				crearAsientos(t,tcod,false)
				crearCuotas(t,9)
				aplicaCuotas(t.cuota9,params[:aplicaciones])
			end
		when 0 # mov fondos
			crearAsientos(t,tcod,false)
		end

	end


	# DELETE /transacciones/1
	def destroy
		if @transaccion.destroy
			redirect_to transacciones_url
		else
			redirect_to transacciones_url, notice: @transaccion.errors.full_messages.join(' ')
		end

	end


	def filtraPorTipos(tipos)

		case tipos
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

		return @ctasD,@ctasH
	end

	def dibujaPantalla
		@codigo = Transacciontipo.find(params[:transacciontipo_id]).codigo
		respond_to do |format|
			format.js {}
		end
	end

	def filtrosinforme

	end

	def informe
		params[:desde].nil? ?  @fd = Date.new(Date.today.year, Date.today.month, 1) : @fd =params[:desde]
		params[:hasta].nil? ? @fh = Date.new(Date.today.year, Date.today.month, -1) : @fh =params[:hasta]
		@cuentas = Cuenta.tipos([3], session[:empresa_id])
		@cuotas = Array.new
		@cuentas.each do |c|
			@cuotas[c.id] = Cuota.pendientes(4, c.id, c.id, session[:empresa_id]).where('cuotas.fecha <= ? and cuotas.fecha >= ?', @fh, @fd)

		end		
	end
		
	def cerrar
	  @transaccion = Transaccion.new
    @transaccion.fecha = Date.today
    @transaccion.cuotascantidad = 1
    @transaccion.transacciontipo_id = Transacciontipo.idxcod(4) 
   	@tipo = @transaccion.transacciontipo.codigo
    filtraPorTipos(@transaccion.transacciontipo.codigo)
    @ctasDS = params[:cuota_id].to_i
		@cuotas = Cuota.pendientes(@tipo, @ctasDS, @ctasDS, session[:empresa_id]) 
		@cApp = params[:cuota]
		@esCierre = true
		render action: 'new'

	end	
	
	def evCtaCte(id) # evalua si es una cuenta corriente y devuelve true or false
		return [2,3].include?(Cuenta.find(id).tipo) 
	end	
	
	def crearCuotas(t,ct) # crea las cueotas a partir de una transacción t= transaccion ct=cuota tipo
		if ct == 6 
			t.cuotascantidad.times do |i| # CREA LA CANTIDAD DE CUOTAS QUE INDICA LA TRANSACCIÓN
				desc = t.desc.gsub("\n","").gsub("\r","") # GSUB SACA TEXTO. ESTO ES PARA NO GUARDAR SALTOS DE LINEA EN LAS CUOTAS
			 	unless i == t.cuotascantidad - 1 
					t.cuotas.create(:fecha => t.fecha.advance(:months => i),:cuota => i+1, :importe =>  t.valorCuota, :desc => "C-" + (i+1).to_s + ": " + desc, :empresa_id => session[:empresa_id], :tipo => 6)
				else
					importe = t.importe - (t.valorCuota * (i))
					t.cuotas.create(:fecha => t.fecha.advance(:months => i),:cuota => i+1, :importe =>  importe, :desc => "C-" + (i+1).to_s + ": " + desc, :empresa_id => session[:empresa_id], :tipo => 6)
				end					
			end
		elsif ct == 9
				desc = t.desc.gsub("\n","").gsub("\r","") # GSUB SACA TEXTO. PARA NO GUARDAR SALTOS DE LINEA EN LAS CUOTAS
				t.cuotas.create(:fecha => t.fecha,:cuota => 0, :importe =>  t.importe, :desc => "CT" + ": " + desc, :empresa_id => session[:empresa_id], :tipo => 9)

		end				
	end
	
	

	def crearAsientos(t,tcod,rm) #paso transaccion y paso si es resultado mensual fijarse si puedo pasar metodos como parametros
		if [1,3].include?(tcod)
			unless t.cuotas.empty? 
				t.cuotas.each_with_index do |c,i|

					t.asientos.create(:fecha => c.fecha, :debe => c.importe, :cuenta_id => t.ctaD_id, :transaccion_id => t.id, :desc => "C: " + c.cuota.to_s + " (" + t.desc + ")", :empresa_id => session[:empresa_id])


					if rm ==true
						importeBruto =  (c.importe * t.bruto/t.importe).round(2) 
						unless t.iva.nil? || t.iva == 0 || t.civa == false
								importeIva =  (c.importe * t.iva/t.importe).round(2) 
							end
						unless i == t.cuotas.length-1
							t.asientos.create(:fecha => c.fecha, :haber => importeBruto, :cuenta_id => t.ctaH_id, :transaccion_id => t.id, :desc => "C: " + c.cuota.to_s + " (" + t.desc + ")", :empresa_id => session[:empresa_id])
							unless t.iva.nil? || t.iva == 0 || t.civa == false
								t.asientos.create(:fecha => c.fecha, :haber => importeIva, :cuenta_id => @current_emp.ctaivaventas, :transaccion_id => t.id, :desc => "C: " + c.cuota.to_s + " (" + t.desc + ")", :empresa_id => session[:empresa_id])
							end
						else
							t.asientos.create(:fecha => c.fecha, :haber => t.bruto - importeBruto * i, :cuenta_id => t.ctaH_id, :transaccion_id => t.id, :desc => "C: " + c.cuota.to_s + " (" + t.desc + ")", :empresa_id => session[:empresa_id])

							unless t.iva.nil? || t.iva == 0 || t.civa == false
								t.asientos.create(:fecha => c.fecha, :haber => t.iva - importeIva * i, :cuenta_id => @current_emp.ctaivaventas, :transaccion_id => t.id, :desc => "C: " + c.cuota.to_s + " (" + t.desc + ")", :empresa_id => session[:empresa_id])
							end
						end
					end
				end
				if rm ==false 	
					t.asientos.create(:fecha => t.fecha, :haber => t.bruto, :cuenta_id => t.ctaH_id, :transaccion_id => t.id, :desc => "T: " + t.id.to_s + " (" + t.desc + ")", :empresa_id => session[:empresa_id])
					unless t.iva.nil? || t.iva == 0 || t.civa == false
						t.asientos.create(:fecha => t.fecha, :haber => t.iva, :cuenta_id => @current_emp.ctaivaventas, :transaccion_id => t.id, :desc => "T: " + t.id.to_s + " (" + t.desc + ")", :empresa_id => session[:empresa_id])
					end
				end
			else
				t.asientos.create(:fecha => t.fecha, :debe => t.importe, :cuenta_id => t.ctaD_id, :transaccion_id => t.id, :desc => "T: " + t.id.to_s + " (" + t.desc + ")", :empresa_id => session[:empresa_id])

				t.asientos.create(:fecha => t.fecha, :haber => t.bruto, :cuenta_id => t.ctaH_id, :transaccion_id => t.id, :desc => "T: " + t.id.to_s + " (" + t.desc + ")", :empresa_id => session[:empresa_id])
				unless t.iva.nil? || t.iva == 0 || t.civa == false
					t.asientos.create(:fecha => t.fecha, :haber => t.iva, :cuenta_id => @current_emp.ctaivaventas, :transaccion_id => t.id, :desc => "T: " + t.id.to_s + " (" + t.desc + ")", :empresa_id => session[:empresa_id])
				end

			end


		elsif [2,4].include?(tcod)
			unless t.cuotas.empty? 

				t.cuotas.each_with_index do |c,i|

					t.asientos.create(:fecha => c.fecha, :haber => c.importe, :cuenta_id => t.ctaH_id, :transaccion_id => t.id, :desc => "C: " + c.cuota.to_s + " (" + t.desc + ")", :empresa_id => session[:empresa_id])

					if rm ==true
						importeBruto =  (c.importe * t.bruto/t.importe).round(2) 
						unless t.iva.nil? || t.iva == 0 || t.civa == false
							importeIva =  (c.importe * t.iva/t.importe).round(2) 
						end
						unless i == t.cuotas.length-1
							t.asientos.create(:fecha => c.fecha, :debe => importeBruto, :cuenta_id => t.ctaD_id, :transaccion_id => t.id, :desc => "C: " + c.cuota.to_s + " (" + t.desc + ")", :empresa_id => session[:empresa_id])

						
							unless t.iva.nil? || t.iva == 0 || t.civa == false
								t.asientos.create(:fecha => c.fecha, :debe => importeIva, :cuenta_id => @current_emp.ctaivacompras, :transaccion_id => t.id, :desc => "C: " + c.cuota.to_s + " (" + t.desc + ")", :empresa_id => session[:empresa_id])
							end
						else
							t.asientos.create(:fecha => c.fecha, :debe => t.bruto - importeBruto * i, :cuenta_id => t.ctaD_id, :transaccion_id => t.id, :desc => "C: " + c.cuota.to_s + " (" + t.desc + ")", :empresa_id => session[:empresa_id])

							unless t.iva.nil? || t.iva == 0 || t.civa == false
								t.asientos.create(:fecha => c.fecha, :debe => t.iva - importeIva * i, :cuenta_id => @current_emp.ctaivacompras, :transaccion_id => t.id, :desc => "C: " + c.cuota.to_s + " (" + t.desc + ")", :empresa_id => session[:empresa_id])
							end
						end
					end
				end
					if rm ==false 	
						t.asientos.create(:fecha => t.fecha, :debe => t.bruto, :cuenta_id => t.ctaD_id, :transaccion_id => t.id, :desc => "T: " + t.id.to_s + " (" + t.desc + ")", :empresa_id => session[:empresa_id])

						unless t.iva.nil? || t.iva == 0 || t.civa == false
							t.asientos.create(:fecha => t.fecha, :debe => t.iva, :cuenta_id => @current_emp.ctaivacompras, :transaccion_id => t.id, :desc => "T: " + t.id.to_s + " (" + t.desc + ")", :empresa_id => session[:empresa_id])
						end
					end
			else
				unless t.iva.nil? || t.iva == 0 || t.civa == false
					t.asientos.create(:fecha => t.fecha, :debe => t.iva, :cuenta_id => @current_emp.ctaivacompras, :transaccion_id => t.id, :desc => "T: " + t.id.to_s + " (" + t.desc + ")", :empresa_id => session[:empresa_id])
				end
				t.asientos.create(:fecha => t.fecha, :debe => t.bruto, :cuenta_id => t.ctaD_id, :transaccion_id => t.id, :desc => "T: " + t.id.to_s + " (" + t.desc + ")", :empresa_id => session[:empresa_id])

				t.asientos.create(:fecha => t.fecha, :haber => t.importe, :cuenta_id => t.ctaH_id, :transaccion_id => t.id, :desc => "T: " + t.id.to_s + " (" + t.desc + ")", :empresa_id => session[:empresa_id])

			end

		else

				t.asientos.create(:fecha => t.fecha, :debe => t.importe, :cuenta_id => t.ctaD_id, :transaccion_id => t.id, :desc => "T: " + t.id.to_s + " (" + t.desc + ")", :empresa_id => session[:empresa_id])

				t.asientos.create(:fecha => t.fecha, :haber => t.importe, :cuenta_id => t.ctaH_id, :transaccion_id => t.id, :desc => "T: " + t.id.to_s + " (" + t.desc + ")", :empresa_id => session[:empresa_id])
		end
	end

	def aplicaCuotasRemoto
		c = Cuota.find(params[:aplicaciones9])
		aplicaCuotas(c, params[:aplicaciones6])

		respond_to do |format|
			format.js {}
		end
	end

	def aplicaCuotas(c,aplicaciones)


		unless aplicaciones.nil?
			importe = c.importe	
			aplicaciones.each do |a|
				cApp = Cuota.find(a.to_i)							
				unless importe < cApp.importe  
					c.aplicaciones9.create(:importe => cApp.importe, :cuota6 => cApp.id)
					importe = importe - cApp.importe
				else
					c.aplicaciones9.create(:importe => importe, :cuota6 => cApp.id)
				end

			end
		end
	end



	private
	# Use callbacks to share common setup or constraints between actions.
	def set_transaccion
		@transaccion = Transaccion.find(params[:id])
	end

	# Only allow a trusted parameter "white list" through.
	def transaccion_params
		params.require(:transaccion).permit(:fecha, :tipo, :importe, :cuotas, :bruto, :iva, :civa)
	end
end
