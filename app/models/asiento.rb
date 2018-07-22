class Asiento < ActiveRecord::Base
	attr_accessible :fecha, :debe, :haber, :transaccion_id, :cuota_id, :cuenta_id, :desc, :empresa_id
  belongs_to :cuenta
  belongs_to :transaccion
  belongs_to :cuota
  
  def self.sesionActual(empresa)
    where('empresa_id in (:empresa)', :empresa => empresa)
	end

	def self.saldoCta(ctas, fecha, empresa)
		where(:cuenta_id => ctas).where('fecha <= :fecha', :fecha => fecha).where('empresa_id in (:empresa)', :empresa => empresa).references(:asientos).sum('coalesce(debe,0) -coalesce(haber,0)', :group => :cuenta_id)

	end	

	def self.saldoMesCta(ctas,fecha, empresa)
		where(:cuenta_id => ctas).where('month(fecha) = :mes and year(fecha) = :year ', :mes => fecha.month, :year => fecha.year).where('empresa_id in (:empresa)', :empresa => empresa).references(:asientos).sum('coalesce(debe,0) -coalesce(haber,0)', :group => :cuenta_id)
	end

def self.saldoPeriodoCta(ctas, desde, hasta, empresa)
		where(:cuenta_id => ctas).where('fecha > :desde AND fecha <= :hasta', :desde => desde, :hasta => hasta).where('empresa_id in (:empresa)', :empresa => empresa).references(:asientos).sum('coalesce(debe,0) -coalesce(haber,0)', :group => :cuenta_id)
end
end
