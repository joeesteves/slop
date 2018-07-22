class ExistenciasController < ApplicationController
	def index
		if(!params[:empCons])
			@consulta = consulta(0)
			@totalesRodeoArry = totalesRodeo(0)
			@filas = Movimiento.find_by_sql("select count(distinct concat(category_id,'-',estado_id)) as fila, rodeo_id from movimientos join (select animal_id, max(movimiento_id) as mid from animals_movimientos group by animal_id) as t on movimientos.id=t.mid join animals as d on t.animal_id=d.id join tipo_accs as e on e.id = tipo_acc_id where e.codigo >= 0 and establecimiento_id = #{session[:establecimiento_id]}  and empresa_id = #{session[:empresa_id]} group by rodeo_id ")
			@empresa = Empresa.find(session[:empresa_id])
			
			
		
		else
			@consultaConsolidado = consultaConsolidado(0,params[:empCons])
			@totalesRodeoArryConsolidado = totalesRodeoConsolidado(0,params[:empCons])
		
			@empresa = Empresa.find(params[:empCons])
			
			@filas = Movimiento.find_by_sql(["select count(distinct concat(category_id,'-',estado_id)) as fila, rodeo_id from movimientos join (select animal_id, max(movimiento_id) as mid from animals_movimientos group by animal_id) as t on movimientos.id=t.mid join animals as d on t.animal_id=d.id join tipo_accs as e on e.id = tipo_acc_id where e.codigo >= 0 and establecimiento_id = #{session[:establecimiento_id]}  and empresa_id IN (:empCons) group by rodeo_id ",{:empCons => params[:empCons]}])
	end	
	
	if (@empresa.instance_of?(Array))
		@empresas = "CONSOLIDADO: "
		@empresa[0...-1].each do |e|
			@empresas += e.nombre + " & "
		end
		@empresas += @empresa.last.nombre
	else
	@empresas	 = @empresa.nombre
	end

	end
	
	def consulta(codigo)
		@consulta = Movimiento.find_by_sql("select sum(kilos) as kilos,count(mid) as cant, category_id, rodeo_id, estado_id from movimientos join (select animal_id, max(movimiento_id) as mid from animals_movimientos group by animal_id) as t on movimientos.id=t.mid join animals as d on t.animal_id=d.id join tipo_accs as e on e.id = tipo_acc_id where e.codigo >= #{codigo} and establecimiento_id = #{session[:establecimiento_id]}  and empresa_id = #{session[:empresa_id]} group by rodeo_id,category_id,estado_id")
		@consulta.sort_by!{|c| [c.rodeo.nombre, c.category.nombre]}
		return @consulta
	end
	
	def totalesRodeo(codigo)
		@totales = Movimiento.find_by_sql("select count(mid) as total, rodeo_id from movimientos join (select animal_id, max(movimiento_id) as mid from animals_movimientos group by animal_id) as t on movimientos.id=t.mid join animals as d on t.animal_id=d.id join tipo_accs as e on e.id = tipo_acc_id where e.codigo >= #{codigo} and establecimiento_id =  #{session[:establecimiento_id]}  and empresa_id = #{session[:empresa_id]} group by rodeo_id order by rodeo_id ")
		@totalesRodeoArry = Array.new()
		@totales.each do |t|
			@totalesRodeoArry[t.rodeo.id] = t.total
		end	

	
			return @totalesRodeoArry
		end
def consultaConsolidado(codigo, empCons)
		@consulta = Movimiento.find_by_sql(["select sum(kilos) as kilos,count(mid) as cant, category_id, rodeo_id, estado_id from movimientos join (select animal_id, max(movimiento_id) as mid from animals_movimientos group by animal_id) as t on movimientos.id=t.mid join animals as d on t.animal_id=d.id join tipo_accs as e on e.id = tipo_acc_id where e.codigo >= #{codigo} and establecimiento_id = #{session[:establecimiento_id]}  and empresa_id IN (:empCons) group by rodeo_id,category_id,estado_id", {:empCons => empCons}])
		@consulta.sort_by!{|c| [c.rodeo.nombre, c.category.nombre]}
		return @consulta
	end
	
	def totalesRodeoConsolidado(codigo, empCons)
		@totales = Movimiento.find_by_sql(["select count(mid) as total, rodeo_id from movimientos join (select animal_id, max(movimiento_id) as mid from animals_movimientos group by animal_id) as t on movimientos.id=t.mid join animals as d on t.animal_id=d.id join tipo_accs as e on e.id = tipo_acc_id where e.codigo >= #{codigo} and establecimiento_id =  #{session[:establecimiento_id]}  and empresa_id IN (:empCons) group by rodeo_id order by rodeo_id ", {:empCons => empCons}])
		@totalesRodeoArry = Array.new()
		@totales.each do |t|
			@totalesRodeoArry[t.rodeo.id] = t.total
		end	

	
			return @totalesRodeoArry
		end


end
