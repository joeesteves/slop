class Evento < ActiveRecord::Base
	attr_accessible  :fecha, :eventotipo_id, :medicion,:registro, :desc, :establecimiento_id
  belongs_to :eventotipo
	belongs_to :establecimiento

  scope :estActual, ->(establecimiento) { where("establecimiento_id = ?", establecimiento) }

  scope :lluviaEstActual, ->(establecimiento) { where("establecimiento_id = ?", establecimiento).joins(:eventotipo).where(:eventotipos => {:codigo => 1}) }
end

