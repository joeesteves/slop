class Rodeo < ActiveRecord::Base
  attr_accessible :desc, :nombre
  has_many :movimientos
end
