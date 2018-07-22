class User < ActiveRecord::Base
	attr_accessible :usuario, :password, :password_confirmation, :establecimiento_ids, :ult_est, :ult_emp
	
	has_secure_password
	
	validates_uniqueness_of :usuario,  :message => "Ups, este mail ya ha sido utilizado"
	validates_presence_of :usuario
	validates_presence_of :password, :on => :create
	has_many :permisos
	has_many :establecimientos, through: :permisos
	has_many :empresas, through: :permisos
	
end
