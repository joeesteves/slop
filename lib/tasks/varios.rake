namespace :limpiar do
	task :transacciones => :environment do
		Aplicacion.all.destroy_all
		Cuota.all.destroy_all
		Asiento.all.destroy_all
		Transaccion.all.destroy_all
	end
end
