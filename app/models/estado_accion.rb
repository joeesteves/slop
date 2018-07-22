class EstadoAccion < ActiveRecord::Base
  belongs_to :estado
  belongs_to :tipo_acc
  attr_accessible :codigo
end
