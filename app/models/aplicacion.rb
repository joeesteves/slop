class Aplicacion < ActiveRecord::Base
	attr_accessible :importe, :cuota6
  belongs_to :cuota
  belongs_to :transaccion
end
