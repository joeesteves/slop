namespace :liniers do
	require 'nokogiri'
	require 'open-uri'
	task :monedas => :environment do
		monedas = Array.new 
		precioProm = Array.new

		url = "http://www.mercadodeliniers.com.ar/dll/hacienda1.dll/haciinfo000002?OPCIONMENU=2&OPCIONSUBMENU=0&txtFechaIni=18/09/2013&txtFechaFin=02/10/2013"
		begin
			doc = Nokogiri::HTML(open(url))
			tabla = doc.css(".clsTextoCarteleraChico")
			tabla.css("tr")[1..40].each_with_index do |cell,i|

				monedas[i] = Array.new
				monedas[i][0] = cell.css("td")[0].content rescue nil
				monedas[i][1] = cell.css("td")[3].content  rescue nil

			end
			monedas.reject! {|c| c[0].nil? || c[0].empty?}
		
		monedas.each do |m|
			if Moneda.find_by_nombre(m[0]).nil?
				Moneda.create(:codigo => 2, :nombre => m[0])
				puts m[0]
			end	
		end
		end

	end

	task :cotizacion => :environment do
		monedas = Array.new 
		precioProm = Array.new
		hoy = Date.today() 
		dia = hoy.wday # wday devuelve 0 para domingo y asi.. solo quiero que ejecute para lunes, martes y miercoles 1, 2 y 3
		hoyFormat = hoy.strftime('%d/%m/%Y')
		if [1,2,3,4,5].include? dia
			url = "http://www.mercadodeliniers.com.ar/dll/hacienda1.dll/haciinfo000002?OPCIONMENU=2&OPCIONSUBMENU=0&txtFechaIni=#{hoyFormat}&txtFechaFin=#{hoyFormat}"
			begin
				doc = Nokogiri::HTML(open(url))
				tabla = doc.css(".clsTextoCarteleraChico")
				tabla.css("tr")[1..40].each_with_index do |cell,i|

					monedas[i] = Array.new
					monedas[i][0] = cell.css("td")[0].content rescue nil
					monedas[i][1] = cell.css("td")[3].content.sub(',','.')  rescue nil

				end
				monedas.reject! {|c| c[0].nil? || c[0].empty?}

				monedas.each do |m|
					unless Moneda.find_by_nombre(m[0]).nil?
						Moneda.find_by_nombre(m[0]).cotizaciones.create(:fecha => hoy, :cotizacion => m[1])
						puts m[0] + " - " + m[1]
					end
				end
			end
		else
			puts "El mercado solo cotiza lunes, martes y miercoles"
		end
	end
end
