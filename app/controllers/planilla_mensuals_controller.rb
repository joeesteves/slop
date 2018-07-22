class PlanillaMensualsController < ApplicationController

	def consulta
		desde = Date.parse(params[:desde])
		hasta = Date.parse(params[:hasta])
		
		
		@desde = desde.strftime("%d/%m/%Y")
		@hasta = hasta.strftime("%d/%m/%Y")
		
		
		
		@movimientos = Movimiento.where("fecha >= '#{desde}' and fecha <= '#{hasta}' and establecimiento_id = #{session[:establecimiento_id]} and empresa_id =#{session[:empresa_id]}").order('category_id ASC, estado_id ASC').page(params[:page]).per(30)
		
		if (!params[:verEstados]) 
		@inicio = Movimiento.find_by_sql("select count(*) as cant, category_id, estado_id from movimientos join (select animal_id,max(movimiento_id) as mid from animals_movimientos where movimiento_id <= (select max(id) from movimientos where fecha <= '#{desde}') group by animal_id) as t on movimientos.id=t.mid join tipo_accs as e on e.id = tipo_acc_id where e.codigo >= 0  and fecha <= '#{desde}' and establecimiento_id = #{session[:establecimiento_id]} and empresa_id = #{session[:empresa_id]}  group by category_id")
		
		
		@fin = Movimiento.find_by_sql("select count(*) as cant, category_id, estado_id from movimientos join (select animal_id,max(movimiento_id) as mid from animals_movimientos where movimiento_id <= (select max(id) from movimientos where fecha <= '#{hasta}') group by animal_id) as t on movimientos.id=t.mid join tipo_accs as e on e.id = tipo_acc_id where e.codigo >= 0  and fecha <= '#{hasta}' and establecimiento_id = #{session[:establecimiento_id]}  and empresa_id = #{session[:empresa_id]} group by category_id")
		
		
		@cambios = Movimiento.find_by_sql("select count(*) as cant, category_id, tipo_acc_id,estado_id,f.cat_ori from movimientos join (select animal_id,movimiento_id as mid from animals_movimientos) as t on movimientos.id=t.mid join tipo_accs as e on e.id = tipo_acc_id join movorigens as f on movimientos.id=f.movimiento_id where e.codigo > 10 and e.codigo < 15 and fecha > '#{desde}' and fecha <= '#{hasta}' and establecimiento_id = #{session[:establecimiento_id]}  and empresa_id = #{session[:empresa_id]} group by category_id")

	 @nac = Movimiento.find_by_sql("select count(*) as cant, category_id, tipo_acc_id,estado_id,f.cat_ori from movimientos join 
(select animal_id,movimiento_id as mid from animals_movimientos) as t on movimientos.id=t.mid join tipo_accs as e on e.id = tipo_acc_id join movorigens as f on movimientos.id=f.movimiento_id where e.codigo =2 and fecha > '#{desde}' and fecha <= '#{hasta}' and establecimiento_id = #{session[:establecimiento_id]} and empresa_id = #{session[:empresa_id]} group by category_id")
   
   @recepcion = Movimiento.find_by_sql("select count(*) as cant, category_id, tipo_acc_id,estado_id from movimientos join (select animal_id,movimiento_id as mid from animals_movimientos) as t on movimientos.id=t.mid join tipo_accs as e on e.id = tipo_acc_id where e.codigo = 3 and fecha > '#{desde}' and fecha <= '#{hasta}' and establecimiento_id = #{session[:establecimiento_id]}  and empresa_id = #{session[:empresa_id]} group by category_id")


   @trasRec = Movimiento.find_by_sql("select count(*) as cant, category_id, tipo_acc_id,estado_id from movimientos join (select animal_id,movimiento_id as mid from animals_movimientos) as t on movimientos.id=t.mid join tipo_accs as e on e.id = tipo_acc_id where e.codigo = 4 and fecha > '#{desde}' and fecha <= '#{hasta}' and establecimiento_id = #{session[:establecimiento_id]}  and empresa_id = #{session[:empresa_id]} group by category_id")


		@despacho = Movimiento.find_by_sql("select count(*) as cant, category_id, tipo_acc_id,estado_id from movimientos join (select animal_id,movimiento_id as mid from animals_movimientos) as t on movimientos.id=t.mid join tipo_accs as e on e.id = tipo_acc_id where e.codigo = -3 and fecha > '#{desde}' and fecha <= '#{hasta}' and establecimiento_id = #{session[:establecimiento_id]}  and empresa_id = #{session[:empresa_id]} group by category_id")

	
		@trasDes = Movimiento.find_by_sql("select count(*) as cant, category_id, tipo_acc_id,estado_id from movimientos join (select animal_id,movimiento_id as mid from animals_movimientos) as t on movimientos.id=t.mid join tipo_accs as e on e.id = tipo_acc_id where e.codigo = -4 and fecha > '#{desde}' and fecha <= '#{hasta}' and establecimiento_id = #{session[:establecimiento_id]}  and empresa_id = #{session[:empresa_id]} group by category_id")

		
	  @recPos = Movimiento.find_by_sql("select count(*) as cant, category_id, tipo_acc_id,estado_id from movimientos join (select animal_id,movimiento_id as mid from animals_movimientos) as t on movimientos.id=t.mid join tipo_accs as e on e.id = tipo_acc_id where e.codigo = 1 and fecha > '#{desde}' and fecha <= '#{hasta}' and establecimiento_id = #{session[:establecimiento_id]}  and empresa_id = #{session[:empresa_id]} group by category_id")
	  
	  @recNeg = Movimiento.find_by_sql("select count(*) as cant, category_id, tipo_acc_id,estado_id from movimientos join (select animal_id,movimiento_id as mid from animals_movimientos) as t on movimientos.id=t.mid join tipo_accs as e on e.id = tipo_acc_id where e.codigo = -1 and fecha > '#{desde}' and fecha <= '#{hasta}' and establecimiento_id = #{session[:establecimiento_id]}  and empresa_id = #{session[:empresa_id]} group by category_id")
	  
	   @mort = Movimiento.find_by_sql("select count(*) as cant, category_id, tipo_acc_id,estado_id from movimientos join (select animal_id,movimiento_id as mid from animals_movimientos) as t on movimientos.id=t.mid join tipo_accs as e on e.id = tipo_acc_id where e.codigo = -2 and fecha > '#{desde}' and fecha <= '#{hasta}' and establecimiento_id = #{session[:establecimiento_id]}  and empresa_id = #{session[:empresa_id]} group by category_id")
	

		@filas = Category.last.id + 1
		
		@ary = Array.new(@filas) { Array.new(12) }
			
	if !@inicio.empty?			
		@inicio.each do |i|
			@ary[i.category.id][0] = i.category.nombre
			@ary[i.category.id][1] = i.cant

		end
	end		

	if !@fin.empty?		
		@fin.each do |i|
			@ary[i.category.id][0] = i.category.nombre
			@ary[i.category.id][12] = i.cant

		end
	end		
	
	if !@cambios.empty?		
		@cambios.each do |i|
			if i.cat_ori != i.category.id
				if(@ary[i.cat_ori][10].nil?)
				 	@ary[i.cat_ori][10] = i.cant
					else
 				 @ary[i.cat_ori][10] = i.cant + @ary[i.cat_ori][10]				
				end 
				@ary[i.category.id][5] = i.cant 
			end
		end	
	end

		if !@nac.empty?					
			@nac.each do |i|
				@ary[i.category.id][2] = i.cant 
			end	
		end		
		if !@recepcion.empty?					
			@recepcion.each do |i|
				@ary[i.category.id][3] = i.cant 
			end	
		end		
		if !@trasRec.empty?					
			@trasRec.each do |i|
				@ary[i.category.id][4] = i.cant 
			end	
		end		
		if !@recPos.empty?					
			@recPos.each do |i|
				@ary[i.category.id][6] = i.cant 
			end	
		end		
		if !@mort.empty?					
			@mort.each do |i|
				@ary[i.category.id][7] = i.cant 
			end	
		end	
		if !@despacho.empty?					
			@despacho.each do |i|
				@ary[i.category.id][8] = i.cant 
			end	
		end		
		if !@trasDes.empty?					
			@trasDes.each do |i|
				@ary[i.category.id][9] = i.cant 
			end	
		end		
		if !@recNeg.empty?					
			@recNeg.each do |i|
				@ary[i.category.id][10] = i.cant 
			end	
		end		


else		
	
		@inicio = Movimiento.find_by_sql("select count(a.id) as cant, category_id, estado_id from movimientos as a join (select max(b.movimiento_id) as mid from movimientos as d join animals_movimientos as b on d.id=b.movimiento_id where d.fecha <= '#{desde}' group by animal_id) as c on a.id = c.mid join tipo_accs as e on e.id = a.tipo_acc_id where e.codigo >= 0 and establecimiento_id = #{session[:establecimiento_id]}  and empresa_id = #{session[:empresa_id]} group by a.category_id, a.estado_id")
		
		
		@fin = Movimiento.find_by_sql("select count(a.id) as cant, category_id, estado_id from movimientos as a join (select max(b.movimiento_id) as mid from movimientos as d join animals_movimientos as b on d.id=b.movimiento_id where d.fecha <= '#{hasta}' group by animal_id) as c on a.id = c.mid join tipo_accs as e on e.id = a.tipo_acc_id where e.codigo >= 0 and establecimiento_id = #{session[:establecimiento_id]}  and empresa_id = #{session[:empresa_id]} group by a.category_id, a.estado_id")
		
		
		@cambios = Movimiento.find_by_sql("select count(*) as cant, category_id, tipo_acc_id,estado_id,f.est_ori,f.cat_ori from movimientos join (select animal_id,movimiento_id as mid from animals_movimientos) as t on movimientos.id=t.mid join tipo_accs as e on e.id = tipo_acc_id join movorigens as f on movimientos.id=f.movimiento_id where (e.codigo > 10 and e.codigo <= 15 or e.codigo =0) and fecha > '#{desde}' and fecha <= '#{hasta}' and establecimiento_id = #{session[:establecimiento_id]}  and empresa_id = #{session[:empresa_id]} group by category_id, estado_id")

	 @nac = Movimiento.find_by_sql("select count(*) as cant, category_id, tipo_acc_id,estado_id,f.est_ori from movimientos join 
(select animal_id,movimiento_id as mid from animals_movimientos) as t on movimientos.id=t.mid join tipo_accs as e on e.id = tipo_acc_id join movorigens as f on movimientos.id=f.movimiento_id where e.codigo =2 and fecha > '#{desde}' and fecha <= '#{hasta}' and establecimiento_id = #{session[:establecimiento_id]}  and empresa_id = #{session[:empresa_id]} group by category_id, estado_id")
   
   @recepcion = Movimiento.find_by_sql("select count(*) as cant, category_id, tipo_acc_id,estado_id from movimientos join (select animal_id,movimiento_id as mid from animals_movimientos) as t on movimientos.id=t.mid join tipo_accs as e on e.id = tipo_acc_id where e.codigo = 3 and fecha > '#{desde}' and fecha <= '#{hasta}' and establecimiento_id = #{session[:establecimiento_id]}  and empresa_id = #{session[:empresa_id]} group by category_id, estado_id")


   @trasRec = Movimiento.find_by_sql("select count(*) as cant, category_id, tipo_acc_id,estado_id from movimientos join (select animal_id,movimiento_id as mid from animals_movimientos) as t on movimientos.id=t.mid join tipo_accs as e on e.id = tipo_acc_id where e.codigo = 4 and fecha > '#{desde}' and fecha <= '#{hasta}' and establecimiento_id = #{session[:establecimiento_id]}  and empresa_id = #{session[:empresa_id]} group by category_id, estado_id")


		@despacho = Movimiento.find_by_sql("select count(*) as cant, category_id, tipo_acc_id,estado_id from movimientos join (select animal_id,movimiento_id as mid from animals_movimientos) as t on movimientos.id=t.mid join tipo_accs as e on e.id = tipo_acc_id where e.codigo = -3 and fecha > '#{desde}' and fecha <= '#{hasta}' and establecimiento_id = #{session[:establecimiento_id]}  and empresa_id = #{session[:empresa_id]} group by category_id, estado_id")

	
		@trasDes = Movimiento.find_by_sql("select count(*) as cant, category_id, tipo_acc_id,estado_id from movimientos join (select animal_id,movimiento_id as mid from animals_movimientos) as t on movimientos.id=t.mid join tipo_accs as e on e.id = tipo_acc_id where e.codigo = -4 and fecha > '#{desde}' and fecha <= '#{hasta}' and establecimiento_id = #{session[:establecimiento_id]}  and empresa_id = #{session[:empresa_id]} group by category_id, estado_id")

		
	  @recPos = Movimiento.find_by_sql("select count(*) as cant, category_id, tipo_acc_id,estado_id from movimientos join (select animal_id,movimiento_id as mid from animals_movimientos) as t on movimientos.id=t.mid join tipo_accs as e on e.id = tipo_acc_id where e.codigo = 1 and fecha > '#{desde}' and fecha <= '#{hasta}' and establecimiento_id = #{session[:establecimiento_id]}  and empresa_id = #{session[:empresa_id]} group by category_id, estado_id")
	  
	  @recNeg = Movimiento.find_by_sql("select count(*) as cant, category_id, tipo_acc_id,estado_id from movimientos join (select animal_id,movimiento_id as mid from animals_movimientos) as t on movimientos.id=t.mid join tipo_accs as e on e.id = tipo_acc_id where e.codigo = -1 and fecha > '#{desde}' and fecha <= '#{hasta}' and establecimiento_id = #{session[:establecimiento_id]}  and empresa_id = #{session[:empresa_id]} group by category_id, estado_id")
	  
	   @mort = Movimiento.find_by_sql("select count(*) as cant, category_id, tipo_acc_id,estado_id from movimientos join (select animal_id,movimiento_id as mid from animals_movimientos) as t on movimientos.id=t.mid join tipo_accs as e on e.id = tipo_acc_id where e.codigo = -2 and fecha > '#{desde}' and fecha <= '#{hasta}' and establecimiento_id = #{session[:establecimiento_id]}  and empresa_id = #{session[:empresa_id]} group by category_id, estado_id")
	
		
		
	@index = Array.new()	
			
	if !@inicio.empty?			
		@inicio.each do |i|
		 @index.push(i.estado.id.to_s + i.category.id.to_s)
		end
	end		

	if !@fin.empty?		
		@fin.each do |i|
		 @index.push(i.estado.id.to_s + i.category.id.to_s)
		end
	end
	@index = @index.uniq
	@ary = Array.new(@index.length) { Array.new(12) }
			

	if !@inicio.empty?			
		@inicio.each do |i|
		
			@ary[@index.index(i.estado.id.to_s + i.category.id.to_s)][0] = i.category.nombre + " - " + i.estado.nombre
			@ary[@index.index(i.estado.id.to_s + i.category.id.to_s)][1] = i.cant

		end
	end		

	if !@fin.empty?		
		@fin.each do |i|
			@ary[@index.index(i.estado.id.to_s + i.category.id.to_s)][0] = i.category.nombre + " - " + i.estado.nombre
			@ary[@index.index(i.estado.id.to_s + i.category.id.to_s)][12] = i.cant

		end
	end		
	
	if !@cambios.empty?		
		@cambios.each do |i|
			if (i.est_ori.to_s + i.cat_ori.to_s != i.estado.id.to_s + i.category.id.to_s)
				if @index.index(i.est_ori.to_s + i.cat_ori.to_s).nil? # si la categoria-estado no esta al inicio ni al fin hay que agregarla
					@index.push(i.est_ori.to_s + i.cat_ori.to_s)
					@ary[@index.index(i.est_ori.to_s + i.cat_ori.to_s)] = Array.new(12)
					@ary[@index.index(i.est_ori.to_s + i.cat_ori.to_s)][0] = Category.find(i.cat_ori).nombre + " - " + Estado.find(i.est_ori).nombre
				end	
				
				if @index.index(i.estado.id.to_s + i.category.id.to_s).nil? # si la categoria-estado no esta al inicio ni al fin hay que agregarla
					@index.push(i.estado.id.to_s + i.category.id.to_s)
					@ary[@index.index(i.estado.id.to_s + i.category.id.to_s)] = Array.new(12)
					@ary[@index.index(i.estado.id.to_s + i.category.id.to_s)][0] = i.category.nombre + " - " + i.estado.nombre
				end	
				
				if (@ary[@index.index(i.est_ori.to_s + i.cat_ori.to_s)][10].nil?)
				 @ary[@index.index(i.est_ori.to_s + i.cat_ori.to_s)][10] = i.cant
				else
 				 @ary[@index.index(i.est_ori.to_s + i.cat_ori.to_s)][10] = i.cant + @ary[@index.index(i.est_ori.to_s + i.cat_ori.to_s)][10]				
				end 
				
			@ary[@index.index(i.estado.id.to_s + i.category.id.to_s)][5] = i.cant 
			end
		end	
	end

		if !@nac.empty?					
			@nac.each do |i|
				if @index.index(i.estado.id.to_s + i.category.id.to_s).nil? # si la categoria-estado no esta al inicio ni al fin hay que agregarla
					@index.push(i.estado.id.to_s + i.category.id.to_s)
					@ary[@index.index(i.estado.id.to_s + i.category.id.to_s)] = Array.new(12)
					@ary[@index.index(i.estado.id.to_s + i.category.id.to_s)][0] = i.category.nombre + " - " + i.estado.nombre
				end	
				@ary[@index.index(i.estado.id.to_s + i.category.id.to_s)][2] = i.cant 
			end	
		end		
		if !@recepcion.empty?					
			@recepcion.each do |i|
				if @index.index(i.estado.id.to_s + i.category.id.to_s).nil? # si la categoria-estado no esta al inicio ni al fin hay que agregarla
					@index.push(i.estado.id.to_s + i.category.id.to_s)
					@ary[@index.index(i.estado.id.to_s + i.category.id.to_s)] = Array.new(12)
					@ary[@index.index(i.estado.id.to_s + i.category.id.to_s)][0] = i.category.nombre + " - " + i.estado.nombre
				end	
				@ary[@index.index(i.estado.id.to_s + i.category.id.to_s)][3] = i.cant 
			end	
		end		
		if !@trasRec.empty?					
			@trasRec.each do |i|
				if @index.index(i.estado.id.to_s + i.category.id.to_s).nil? # si la categoria-estado no esta al inicio ni al fin hay que agregarla
					@index.push(i.estado.id.to_s + i.category.id.to_s)
					@ary[@index.index(i.estado.id.to_s + i.category.id.to_s)] = Array.new(12)
					@ary[@index.index(i.estado.id.to_s + i.category.id.to_s)][0] = i.category.nombre + " - " + i.estado.nombre
				end	
				@ary[@index.index(i.estado.id.to_s + i.category.id.to_s)][4] = i.cant 
			end	
		end		
		if !@recPos.empty?					
			@recPos.each do |i|
				if @index.index(i.estado.id.to_s + i.category.id.to_s).nil? # si la categoria-estado no esta al inicio ni al fin hay que agregarla
					@index.push(i.estado.id.to_s + i.category.id.to_s)
					@ary[@index.index(i.estado.id.to_s + i.category.id.to_s)] = Array.new(12)
					@ary[@index.index(i.estado.id.to_s + i.category.id.to_s)][0] = i.category.nombre + " - " + i.estado.nombre
				end	
				@ary[@index.index(i.estado.id.to_s + i.category.id.to_s)][6] = i.cant 
			end	
		end		
		if !@mort.empty?					
			@mort.each do |i|
				@ary[@index.index(i.estado.id.to_s + i.category.id.to_s)][7] = i.cant 
			end	
		end	
		if !@despacho.empty?					
			@despacho.each do |i|
				@ary[@index.index(i.estado.id.to_s + i.category.id.to_s)][8] = i.cant 
			end	
		end		
		if !@trasDes.empty?					
			@trasDes.each do |i|
				@ary[@index.index(i.estado.id.to_s + i.category.id.to_s)][9] = i.cant 
			end	
		end		
		if !@recNeg.empty?					
			@recNeg.each do |i|
				@ary[@index.index(i.estado.id.to_s + i.category.id.to_s)][11] = i.cant 
			end	
		end		
	end
@ary = @ary.delete_if { |elem| elem[0].nil? }
@ary.sort_by!{|k| k[0]}

	respond_to do |format|
			format.html # consulta.html.erb
	
		end

end
end
