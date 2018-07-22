class Tarea < ActiveRecord::Base
	attr_accessible :fecha, :titulo, :desc, :estado, :establecimiento_id
  belongs_to :establecimiento
  
  scope :pendientes, lambda { |establecimiento|  where(estado: [0,1]).where(:establecimiento_id => establecimiento) }
  scope :finalizadas, where(estado: [2])
end
