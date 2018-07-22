class Empresa < ActiveRecord::Base
	attr_accessible :codigo, :nombre, :user_ids, :users, :catfiscal_id, :ctaivacompras, :ctaivaventas
	has_many :permisos
	has_many :users, through: :permisos 
	has_many :transacciones
	belongs_to :catfiscal
	
end
