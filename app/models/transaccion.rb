class Transaccion < ActiveRecord::Base
	attr_accessible :transacciontipo_id, :importe, :cuotascantidad, :ctaD_id, :bruto, :iva, :civa
	attr_accessible :ctaH_id, :fecha, :transacciontipo, :empresa_id, :desc, :valorCuota, :rmensuales
	has_many :asientos
	has_many :cuotas
	has_many :aplicaciones9, through: :cuotas
	has_many :aplicaciones6, through: :cuotas
	belongs_to :transacciontipo
	belongs_to :empresa
	before_destroy :check_before_destroy
	before_update :check_before_update



	def self.sesionActual(empresa)
    where('empresa_id in (:empresa)', :empresa => empresa)
	end


	def check_before_destroy
		unless aplicaciones6.empty?  and aplicaciones9.empty?
			self.errors.add_to_base("ESTA TRANSACCION SE ENCUENTRA APPLICADA")
			return false
		else
			cuotas.destroy_all
			asientos.destroy_all
		end
	end

	def check_before_update
		unless aplicaciones6.empty? 
			self.errors.add_to_base("ESTA TRANSACCION SE ENCUENTRA APPLICADA")
			return false
		else
			cuotas.destroy_all
			asientos.destroy_all
		end
	end

	def cuota9
		cuotas.where(:cuotas =>{:tipo =>9})[0]
	end

end


