class Cuenta < ActiveRecord::Base
	attr_accessible :codigo, :nombre, :tipo, :cierre, :empresa_id
  has_many :asientos

	def self.sesionActual(empresa)
    where('empresa_id in (:empresa)', :empresa => empresa)
	end
	
	def self.ctes(empresa)
    where(:tipo => 2).where('empresa_id in (:empresa)', :empresa => empresa)
	end	

	def self.tipos(tipos, empresa)
		tipos.to_a
    where(:tipo => tipos).where('empresa_id in (:empresa)', :empresa => empresa)
	end	
	
	def self.importar(file)
		CSV.foreach(file.path, headers: true ) do |row|
		Cuenta.create! row.to_hash
		end
	end

	def self.conSaldo(tipos,fecha,empresa)
		where(:tipo => tipos).where('cuentas.empresa_id in (:empresa)', :empresa => empresa).joins(:asientos).group('cuentas.id').where('asientos.fecha <= :fecha', :fecha => fecha).having('coalesce(sum(asientos.debe),0)-coalesce(sum(asientos.haber),0) != 0').references(:cuotas,:asientos)

	end
end
