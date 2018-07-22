class MovimientosController < ApplicationController
	before_filter :fill_selector, :only => [:new, :edit]

	def fill_selector
		@rodeos = Rodeo.all
		@estados = Estado.all
		@categorias = Category.all
		@acciones =  TipoAcc.where('codigo != 0').order('codigo asc')
	end



	# GET /movimientos
	# GET /movimientos.json
	def index
		if(!params[:empCons])
			@movimientos = Movimiento.sesionActual(session[:establecimiento_id],session[:empresa_id])
		else
			@movimientos = Movimiento.sesionActual(session[:establecimiento_id],params[:empCons])
		end		
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @movimientos }
			format.xls
		end
	end

	def show
		@movimiento = Movimiento.find(params[:id])

		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @movimiento }
		end
	end

	def new	
		@movimiento = Movimiento.new
		@movimiento.fecha = Date.today

		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @movimiento }
		end
	end

	# GET /movimientos/1/edit
	def edit
		@acciones =  TipoAcc.all
		@movimiento = Movimiento.find(params[:id])
		if @movimiento.tipo_acc.codigo > 10 ||  @movimiento.tipo_acc.codigo == 2 || @movimiento.tipo_acc.codigo == 0 && @movimiento.movorigen  
			@catOri = Category.find(@movimiento.movorigen.cat_ori)
			@estOri = Estado.find(@movimiento.movorigen.est_ori)
			@rodOri = Rodeo.find(@movimiento.movorigen.rod_ori)

		end	
		respond_to do |format|
			format.html
			format.js {}

		end
	end

	def create
		@movimiento = Movimiento.new(params[:movimiento])
		@movimiento.establecimiento_id = session[:establecimiento_id]
		@movimiento.empresa_id = session[:empresa_id]


		if Movimiento.exists?
			@UltMov = Movimiento.last.id + 1
		else 			
			@UltMov = "Origen" 		
		end	

		if @movimiento.tipo_acc.codigo > 0 && @movimiento.tipo_acc.codigo <= 10 # Para los acciones entre 1 y 10 creamos animales
			ary = Array.new(@movimiento.cantidad)
			$i=0
			while $i < @movimiento.cantidad
				@animal = Animal.create(:activo => true, :desc => "Creado por el movimiento #{@UltMov}")
				ary[$i] = @animal.id
				$i = $i + 1
			end



			if @movimiento.save
				@movimiento.update_attributes(:animal_ids => ary) 		

				if @movimiento.tipo_acc.codigo == 2
					@codParir = TipoAcc.where(:codigo =>0).last.id
					@estDest = EstadoAccion.joins(:tipo_acc).where(:tipo_accs =>{:codigo =>0}).last.estado_id

					@movMadre = Movimiento.new(:tipo_acc_id => @codParir, :estado_id => @estDest, :category_id => params[:cat_ori], :rodeo_id => params[:rod_ori], :cantidad => params[:movimiento][:cantidad], :fecha => @movimiento.fecha)
					@movMadre.establecimiento_id = session[:establecimiento_id]
					@movMadre.empresa_id = session[:empresa_id]
					@movMadre.save
					@animals = buscaAnimals(params[:est_ori],params[:cat_ori],params[:rod_ori],params[:movimiento][:cantidad],nil)


					@movMadre.update_attributes(:animal_ids => @animals.collect(&:id)) 		

					@movOri = @movimiento.build_movorigen(:cat_ori => params[:cat_ori], :est_ori => params[:est_ori], :rod_ori => params[:rod_ori])
					@movOri.save

					@movOriMadre = @movMadre.build_movorigen(:cat_ori => params[:cat_ori], :est_ori => params[:est_ori], :rod_ori => params[:rod_ori])
					@movOriMadre.save
				end



			end 
		end # finaliza el if por codigo 1 al 10

		if @movimiento.tipo_acc.codigo < 0 # Para los acciones tipo 2 usamos animales y los desactivamos

			@animals = buscaAnimals(@movimiento.estado_id,@movimiento.category_id,@movimiento.rodeo_id,@movimiento.cantidad,nil)

			@animals.each do |a|
				Animal.find(a.id).update_attributes(:activo => false)
			end	 

			if @movimiento.save
				@movimiento.update_attributes(:animal_ids => @animals.collect(&:id))


			end
		end # finaliza el if por codigo 2

		if @movimiento.tipo_acc.codigo > 10 # Para los acciones tipo 3 usamos animales
			@animals = buscaAnimals(params[:est_ori],params[:cat_ori],params[:rod_ori],@movimiento.cantidad,nil)
			@movimiento.save
			@movimiento.update_attributes(:animal_ids => @animals.collect(&:id))
			@movOri = @movimiento.build_movorigen(:cat_ori => params[:cat_ori], :est_ori => params[:est_ori], :rod_ori => params[:rod_ori])
			@movOri.save
		end # finaliza el if por codigo 10
		respond_to do |format|
			format.html { redirect_to new_movimiento_path, notice: 'MOVIMIENTO CREADO CORRECTAMENTE' }
		end
	end

	def update
		@movimiento = Movimiento.find(params[:id])
		@cantInicial = @movimiento.cantidad
		@cantFinal = params[:movimiento][:cantidad].to_i


		if @movimiento.tipo_acc.codigo > 0 && @movimiento.tipo_acc.codigo <= 10 # Para acciones tipo 1 cantidad original > o < q la final
			if  @cantFinal > @cantInicial # para cantidad mayor que crea nuevos animales y act animals_movimientos
				@diferencia = @cantFinal - @cantInicial
				ary = Array.new(@diferencia)
				$i=0
				while $i < @diferencia
					@animal = Animal.create(:activo => true, :desc => "Creado por la actualizacion del movimiento #{@movimiento.id}")
					ary[$i] = @animal.id
					$i = $i + 1
				end # end del while
				@movimiento.save
				@movimiento.update_attributes(:animal_ids => @movimiento.animal_ids+ary)	
				if  @movimiento.tipo_acc.codigo == 2

					@movMadre = Movimiento.find(@movimiento.id + 1)
					@animalsOri = buscaAnimals(@movimiento.movorigen.est_ori,@movimiento.movorigen.cat_ori,@movimiento.movorigen.rod_ori,@diferencia,nil)

					@movMadre.save	
					@movMadre.update_attributes(:cantidad => params[:movimiento][:cantidad])
					@movMadre.update_attributes(:animal_ids => @movMadre.animal_ids+ @animalsOri.collect(&:id)) 		


				end # end de  @movimiento.tipo_acc.codigo == 2

			else  @cantFinal < @cantInicial # para cantidad menor que borra animales y act animals_movimientos
				@diferencia = (@cantFinal - @cantInicial) * (-1)

				@animals = buscaAnimals(@movimiento.estado_id,@movimiento.category_id,@movimiento.rodeo_id,@diferencia,nil)

				Animal.destroy(@animals.collect(&:id))

				@movimiento.save
				@movimiento.update_attributes(:animal_ids => @movimiento.animal_ids)
				if  @movimiento.tipo_acc.codigo == 2

					@movMadre = Movimiento.find(@movimiento.id + 1)
					@animalsOri =  buscaAnimals(@movMadre.estado_id,@movMadre.category_id,@movMadre.rodeo_id,@diferencia,@movMadre.id)

					@movMadre.save	
					@movMadre.update_attributes(:cantidad => params[:movimiento][:cantidad])
					@movMadre.update_attributes(:animal_ids => @movMadre.animal_ids-@animalsOri.collect(&:id)) 		


				end # end de  @movimiento.tipo_acc.codigo == 2

			end	# end del if que evalua cant mayor o menor	




		elsif  @movimiento.tipo_acc.codigo < 0  

			if  @cantFinal > @cantInicial # para cantidad mayor que crea nuevos animales y act animals_movimientos
				@diferencia = @cantFinal - @cantInicial
				@animals = buscaAnimals(@movimiento.estado_id,@movimiento.category_id,@movimiento.rodeo_id,@diferencia,nil)


				Animal.find(@animals.collect(&:id)).each do |a|
					a.update_attributes(:activo => false)
				end

				@movimiento.save
				@movimiento.update_attributes(:animal_ids => @movimiento.animal_ids+@animals.collect(&:id))	
			elsif  @cantFinal < @cantInicial# para if que evalua cant del codigo dos
				@diferencia = (@cantFinal - @cantInicial)*(-1)
				@animals = buscaAnimals(@movimiento.estado_id,@movimiento.category_id,@movimiento.rodeo_id,@diferencia,@movimiento.id)
				
				Animal.find(@animals.collect(&:id)).each do |a|
					a.update_attributes(:activo => true)
				end
				@movimiento.save
				@movimiento.update_attributes(:animal_ids => @movimiento.animal_ids - @animals.collect(&:id))
			end # end del if que evalua cantidad para codigo 2

		elsif  @movimiento.tipo_acc.codigo > 10 && @movimiento.tipo_acc.codigo < 20
			if  @cantFinal > @cantInicial # para cantidad mayor que crea nuevos animales y act animals_movimientos
				@diferencia = @cantFinal - @cantInicial
				@animals = buscaAnimals(@movimiento.movorigen.est_ori,@movimiento.movorigen.cat_ori,@movimiento.movorigen.rod_ori,@diferencia,nil)
				@movimiento.save
				@movimiento.update_attributes(:animal_ids => @movimiento.animal_ids + @animals.collect(&:id))	
			elsif  @cantFinal < @cantInicial# para if que evalua cant del codigo dos
				@diferencia = (@cantFinal - @cantInicial)*(-1)
				@animals = buscaAnimals(@movimiento.estado_id,@movimiento.category_id,@movimiento.rodeo_id,@diferencia,@movimiento.id)

				@movimiento.save
				@movimiento.update_attributes(:animal_ids => @movimiento.animal_ids - @animals.collect(&:id))		
			end 
		else  

			@movimiento.save

		end  # end de el if que evalua los codigos de acciones 
		
		respond_to do |format|
			if @movimiento.update_attributes(params[:movimiento])
				format.html { redirect_to movimientos_path, notice: 'SE HAN GUARDADO LOS CAMBIOS' }
				format.json { head :no_content }
			else
				format.html { render action: "edit" }
				format.json { render json: @movimiento.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /movimientos/1
	# DELETE /movimientos/1.json
	def destroy
		@movimiento = Movimiento.find(params[:id])
		ary = @movimiento.animal_ids
		@movimiento.animals.clear

		if @movimiento.tipo_acc.codigo > 0 && @movimiento.tipo_acc.codigo <= 10
			Animal.delete(ary)   	    	
		end

		if @movimiento.tipo_acc.codigo == 2
			@movMadre = Movimiento.find(@movimiento.id+1)
			@movMadre.animals.clear
			@movMadre.destroy

		end



		if @movimiento.tipo_acc.codigo < 0  
			Animal.find(ary).each do |a|
				a.update_attributes(:activo => true)
			end	
		end



		@movimiento.destroy


		respond_to do |format|
			format.html { redirect_to movimientos_url }
			format.json { head :no_content }
		end
	end


	def sel

		if params[:tipo_acc_id] != ''
			@codAcc = TipoAcc.find(params[:tipo_acc_id])
			@seleccion1 = Category.joins(:catTipo => :tipo_accs).where(:tipo_accs  => {:id => params[:tipo_acc_id]})
			@cant = @seleccion1.count
		end # lo hace siempre que haya una accion sel

		if params[:edit]
			@usaSel = true
			if @codAcc != 2
				@seleccion = @seleccion1
			end
			@seleccion = Category.joins(:catTipo => :tipo_accs).where(:tipo_accs  => {:codigo => 0}) + @seleccion1

			@catSel = params[:category_id]
			@rodSel = params[:rodeo_id]
			@estSel = params[:estado_id]
			if (@codAcc.codigo > 10 || @codAcc.codigo == 2)
				@catOriSel = params[:cat_ori]
				@rodOriSel = params[:rod_ori]
				@estOriSel = params[:est_ori]
				@animals = cantAnimals(params[:est_ori],params[:cat_ori],params[:rod_ori],params[:fecha])

				@animales = buscaAnimals(@estadosOri.first.id,@seleccion1.first.id,@rodeos.first.id, @animals[0].cant, nil)
			else
				@animals =  cantAnimals(params[:estado_id],params[:category_id],params[:rodeo_id],params[:fecha])
				@animales = buscaAnimals(@estadosOri.first.id,@seleccion1.first.id,@rodeos.first.id, @animals[0].cant, nil)
			end
			@estadosDest = Estado.joins("join estado_accions as e on estados.id=e.estado_id join cat_tipos_estados as c on estados.id = c.estado_id join categories as d on c.cat_tipo_id = d.catTipo_id where tipo_acc_id=#{params[:tipo_acc_id]} and d.id = #{params[:category_id]} and e.codigo IN (2,3)")
			@estadosOri = Estado.joins("join estado_accions as e on estados.id=e.estado_id join cat_tipos_estados as c on estados.id = c.estado_id join categories as d on c.cat_tipo_id = d.catTipo_id where tipo_acc_id=#{params[:tipo_acc_id]} and d.id = #{params[:cat_ori]} and e.codigo IN (1,3)")

		end

		if !params[:soloEstado]
			@rodeos = Rodeo.all	

			if params[:accion] && params[:tipo_acc_id] != ''
				@pesoEstandard = @seleccion1.first.pesoEstandard		
				@seleccion = @seleccion1
				@estadosDest = Estado.joins("join estado_accions as e on estados.id=e.estado_id join cat_tipos_estados as c on estados.id = c.estado_id join categories as d on c.cat_tipo_id = d.catTipo_id where tipo_acc_id=#{params[:tipo_acc_id]} and d.id = #{@seleccion1.first.id} and e.codigo IN (2,3)")

				if @codAcc.codigo < 10
					if @codAcc.codigo == 2 # es un nacimiento
						@catOri =  Category.joins('join cat_tipos as a on a.id=CatTipo_id join cat_tipos_tipo_accs as b on CatTipo_id=b.cat_tipo_id join tipo_accs as c on b.tipo_acc_id=c.id where c.codigo=0')

						@estadosOri = Estado.joins("join estado_accions as e on estados.id=e.estado_id join cat_tipos_estados as c on estados.id = c.estado_id join categories as d on c.cat_tipo_id = d.catTipo_id where tipo_acc_id=#{params[:tipo_acc_id]} and d.id = #{@catOri.first.id} and e.codigo IN (1,3)")
					end

					if !@estadosDest.empty?
						if @codAcc.codigo == 2
							@animals = cantAnimals(@estadosOri.first.id,@catOri.first.id,@rodeos.first.id,params[:fecha])

	            @animales = buscaAnimals(@estadosOri.first.id,@seleccion1.first.id,@rodeos.first.id, @animals[0].cant, nil)

						else
							@animals =  cantAnimals(@estadosDest.first.id,@seleccion1.first.id,@rodeos.first.id,params[:fecha])

	            @animales = buscaAnimals(@estadosOri.first.id,@seleccion1.first.id,@rodeos.first.id, @animals[0].cant, nil)
						end
					end 
				end

				if @codAcc.codigo > 10


					@estadosOri = Estado.joins("join estado_accions as e on estados.id=e.estado_id join cat_tipos_estados as c on estados.id = c.estado_id join categories as d on c.cat_tipo_id = d.catTipo_id where tipo_acc_id=#{params[:tipo_acc_id]} and d.id = #{@seleccion1.first.id} and e.codigo IN (1,3)")

					if !@estadosOri.empty?
						@animals = cantAnimals(@estadosOri.first.id,@seleccion1.first.id,@rodeos.first.id,params[:fecha])

	            @animales = buscaAnimals(@estadosOri.first.id,@seleccion1.first.id,@rodeos.first.id, @animals[0].cant, nil)
					end
				end
				
			else # cambio de selectores que no sean accion
				
				if params[:tipo_acc_id] != ''
					@pesoEstandard = Category.find(params[:category_id]).pesoEstandard
					if  @codAcc.codigo > 10 && params[:cat_ori] != ''
						@estadosOri = Estado.joins("join estado_accions as e on estados.id=e.estado_id join cat_tipos_estados as c on estados.id = c.estado_id join categories as d on c.cat_tipo_id = d.catTipo_id where tipo_acc_id=#{params[:tipo_acc_id]} and e.codigo IN (1,3) and d.id=#{params[:cat_ori]}")
						if !@estadosOri.empty?					 						 		
							@animals = cantAnimals(@estadosOri.first.id,params[:cat_ori],@rodeos.first.id,params[:fecha])
	            @animales = buscaAnimals(@estadosOri.first.id,@seleccion1.first.id,@rodeos.first.id, @animals[0].cant, nil)

						end					

					elsif @codAcc.codigo > 10  

						@estadosOri = Estado.joins("join estado_accions as e on estados.id=e.estado_id join cat_tipos_estados as c on estados.id = c.estado_id join categories as d on c.cat_tipo_id = d.catTipo_id where tipo_acc_id=#{params[:tipo_acc_id]} and d.id = #{@seleccion1.first.id} and e.codigo IN (1,3)")
						if !@estadosOri.empty?			
							@animals = cantAnimals(@estadosOri.first.id,@seleccion1.first.id,@rodeos.first.id,params[:fecha])		 	
	            @animales = buscaAnimals(@estadosOri.first.id,@seleccion1.first.id,@rodeos.first.id, @animals[0].cant, nil)
							
						end
					end # cont cat_ori?

					if params[:category_id] != ''
					 
						@estadosDest = Estado.joins("join estado_accions as e on estados.id=e.estado_id join cat_tipos_estados as c on estados.id = c.estado_id join categories as d on c.cat_tipo_id = d.catTipo_id where tipo_acc_id=#{params[:tipo_acc_id]} and d.id = #{params[:category_id]} and e.codigo IN (2,3)")
						if @codAcc.codigo < 10
							if !@estadosDest.empty?
								if @codAcc.codigo == 2 && params[:cat_ori] != ''
									@estadosOri = Estado.joins("join estado_accions as e on estados.id=e.estado_id join cat_tipos_estados as c on estados.id = c.estado_id join categories as d on c.cat_tipo_id = d.catTipo_id where tipo_acc_id=#{params[:tipo_acc_id]} and d.id = #{params[:cat_ori]} and e.codigo IN (1,3)")

									@animals = cantAnimals(@estadosOri.first.id,params[:cat_ori],@rodeos.first.id,params[:fecha])
	            @animales = buscaAnimals(@estadosOri.first.id,@seleccion1.first.id,@rodeos.first.id, @animals[0].cant, nil)
								else								
									@animals = cantAnimals(@estadosDest.first.id,params[:category_id],@rodeos.first.id,params[:fecha])
	            @animales = buscaAnimals(@estadosOri.first.id,@seleccion1.first.id,@rodeos.first.id, @animals[0].cant, nil)


								end
							end
						end
					else
						@estadosDest = Estado.joins("join estado_accions as e on estados.id=e.estado_id join cat_tipos_estados as c on estados.id = c.estado_id join categories as d on c.cat_tipo_id = d.catTipo_id where tipo_acc_id=#{params[:tipo_acc_id]} and d.id = #{@seleccion1.first.id} and e.codigo IN (2,3)")
						if @codAcc.codigo < 10
							if !@estadosDest.empty?
								if @codAcc.codigo == 2 && params[:cat_ori] != ''
									@animals = cantAnimals(@estadosOri.first.id,params[:cat_ori],@rodeos.first.id)
	            @animales = buscaAnimals(@estadosOri.first.id,@seleccion1.first.id,@rodeos.first.id, @animals[0].cant, nil)

								else
									@animals = cantAnimals(@estadosDest.first.id,@seleccion1.first.id,@rodeos.first.id,params[:fecha])
	            @animales = buscaAnimals(@estadosOri.first.id,@seleccion1.first.id,@rodeos.first.id, @animals[0].cant, nil)

								end
							end
						end
					end # cont category_id?
				end		# en controlador de que haya acc_id
			end # end selector accion

		elsif @codAcc && @codAcc.codigo > 10 || @codAcc && @codAcc.codigo == 2 # para cambios exclusivos de estado			
			@pesoEstandard = Category.find(params[:category_id]).pesoEstandard
			if params[:est_ori] != ''
				@animals = cantAnimals(params[:est_ori],params[:cat_ori],params[:rod_ori],params[:fecha])
	            @animales = buscaAnimals(@estadosOri.first.id,@seleccion1.first.id,@rodeos.first.id, @animals[0].cant, nil)

			end
		else			 # para cambios exclusivos de estado
			@pesoEstandard = Category.find(params[:category_id]).pesoEstandard
			@animals =  cantAnimals(params[:estado_id],params[:category_id],params[:rodeo_id],params[:fecha])
			@animales = buscaAnimals(@estadosOri.first.id,@seleccion1.first.id,@rodeos.first.id, @animals[0].cant, nil)

		end	


		respond_to do |format|
			format.js {}
		end

	end

	def cantAnimals(estado,categoria,rodeo,fecha) # funcion utilizada para devolver la cantidad de animales disponibles para c/ transaccion
		@animals = Movimiento.find_by_sql("select count(mid) as cant, category_id, rodeo_id, estado_id, fecha from movimientos join (select animal_id, max(movimiento_id) as mid from animals_movimientos group by animal_id) as t on movimientos.id=t.mid join animals as d on t.animal_id=d.id join tipo_accs as e on e.id = tipo_acc_id where e.codigo >= 0 and estado_id=#{estado} and category_id=#{categoria} and rodeo_id = #{rodeo} and fecha <= '#{fecha}' and establecimiento_id = #{session[:establecimiento_id]}")
		return @animals 
	end

	def buscaAnimals(estado,categoria,rodeo,cantidad,movId)
		if movId == nil 
			@animales = Animal.joins("join (select animal_id,max(movimiento_id) as mid from animals_movimientos group by animal_id) as a on  a.animal_id=id join movimientos as b on b.id=a.mid where estado_id=#{estado} and category_id = #{categoria} and rodeo_id = #{rodeo} and activo=1 and establecimiento_id = #{session[:establecimiento_id]}").limit(cantidad)
		else
			@animales = Animal.joins("join (select animal_id,max(movimiento_id) as mid from animals_movimientos group by animal_id) as a on  a.animal_id=id join movimientos as b on b.id=a.mid where estado_id=#{estado} and category_id = #{categoria} and rodeo_id = #{rodeo} and b.id=#{movId} and establecimiento_id = #{session[:establecimiento_id]}").limit(cantidad)
		end
		return @animales

	end

end
