class BienvenidosController < ApplicationController

	def index

		unless @current_est.nil?
			@clima = @current_est.clima
			@tareasPendientes = Tarea.pendientes(@current_est.id)
			@lluvias = Evento.lluviaEstActual(@current_est.id).last(5)	
		end

		@cotLiniers = Cotizacion.cotLiniers
	end



end
