class Cuota < ActiveRecord::Base
	attr_accessible :fecha, :importe, :cuota, :transaccion_id, :desc, :empresa_id, :tipo
	belongs_to :transaccion
	has_many :asientos, dependent: :destroy
	has_many :aplicaciones6, class_name: Aplicacion, foreign_key: :cuota6, dependent: :destroy
	has_many :aplicaciones9, class_name: Aplicacion, foreign_key: :cuota9, dependent: :destroy

  def self.sesionActual(empresa)
    where('empresa_id in (:empresa)', :empresa => empresa)
	end

	def self.pendientes(tipo,ctaD,ctaH,empresa)
		case tipo
			when 3  # si es una cobranza, se fija los ingresos (codigo 1) y sus cuotas. Filtra ingresos por cuenta debe

				all.joins(transaccion: :transacciontipo).includes(:aplicaciones6).where(:transacciontipos => {:codigo => 1}).where(:transacciones => {:ctaD_id => ctaH}).where('cuotas.empresa_id in (:empresa) and cuotas.tipo = 6', :empresa => empresa).having('sum(aplicaciones.importe) < cuotas.importe OR aplicaciones.importe is null').group('cuotas.id').references(:aplicaciones6,:cuotas)

			when 4 # si es una pago, se fija los egresos (codigo 2) y sus cuotas. Filtra ingresos por cuenta debe

				all.joins(transaccion: :transacciontipo).includes(:aplicaciones6).where(:transacciontipos => {:codigo => [2,4]}).where(:transacciones => {:ctaH_id => ctaD}).where('cuotas.empresa_id in (:empresa) and cuotas.tipo = 6', :empresa => empresa).group('cuotas.id').having('sum(aplicaciones.importe) < cuotas.importe OR aplicaciones.importe is null').references(:aplicaciones6,:cuotas)
		end
	end

	def self.pendientes9(tipo,ctaD,ctaH,empresa)
		case tipo
			when 3  # si es una cobranza, se fija los ingresos (codigo 1) y sus cuotas. Filtra ingresos por cuenta debe

				all.joins(transaccion: :transacciontipo).includes(:aplicaciones9).where(:transacciontipos => {:codigo => 1}).where(:transacciones => {:ctaH_id => ctaH}).where('cuotas.empresa_id in (:empresa) and cuotas.tipo = 9', :empresa => empresa).having('sum(aplicaciones.importe) < cuotas.importe OR aplicaciones.importe is null').group('cuotas.id').references(:aplicaciones9,:cuotas)
			
			when 4 # si es una pago, se fija los egresos (codigo 2) y sus cuotas. Filtra ingresos por cuenta debe
				all.joins(transaccion: :transacciontipo).includes(:aplicaciones9).where(:transacciontipos => {:codigo => [2,4]}).where(:transacciones => {:ctaD_id => ctaD}).where('cuotas.empresa_id in (:empresa) and cuotas.tipo = 9', :empresa => empresa).group('cuotas.id').having('sum(aplicaciones.importe) < cuotas.importe OR aplicaciones.importe is null').references(:aplicaciones9,:cuotas)
		end
	end
end

