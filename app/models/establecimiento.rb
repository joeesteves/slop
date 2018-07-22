class Establecimiento < ActiveRecord::Base
	attr_accessible :codigo, :nombre, :user_ids, :users, :clima
	has_many :permisos
	has_many :users, through: :permisos 
	has_many :eventos	
end
