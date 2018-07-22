class Category < ActiveRecord::Base
  belongs_to :catTipo
  attr_accessible :desc, :nombre, :catTipo_id, :pesoEstandard, :trazabilidad	
  has_many :movimientos
  validates :catTipo_id, :presence => true
end
