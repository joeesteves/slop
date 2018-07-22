class Cotizacion < ActiveRecord::Base
	attr_accessible :fecha, :moneda_id, :cotizacion 
	belongs_to :moneda
	validates_uniqueness_of :fecha, :scope => :moneda_id

	def self.cotLiniers
			joins("join (select moneda_id, max(fecha) as maxfecha from cotizaciones group by moneda_id) as l on cotizaciones.moneda_id = l.moneda_id where fecha=maxfecha")

	end
end
