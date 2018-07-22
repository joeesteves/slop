class Moneda < ActiveRecord::Base
	attr_accessible :codigo, :nombre, :cotizacion_id
	has_many :cotizaciones
end
