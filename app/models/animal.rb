class Animal < ActiveRecord::Base
  attr_accessible :activo, :desc, :nombre, :rp
  has_and_belongs_to_many :movimientos
end
