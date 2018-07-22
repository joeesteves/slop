class Transacciontipo < ActiveRecord::Base
	attr_accessible :codigo, :nombre
	has_many :transacciones
	scope :idxcod, lambda {|cod| where(codigo: cod).first().id }
end
