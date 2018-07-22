class Permiso < ActiveRecord::Base
	attr_accessible :establecimiento_ids, :permiso
	belongs_to :user
	belongs_to :establecimiento
	belongs_to :empresa
end
