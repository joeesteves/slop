class Estado < ActiveRecord::Base
  attr_accessible :desc, :nombre, :tipo_acc_ids
  has_many :movimientos
  has_many :estado_accions
  has_and_belongs_to_many :cat_tipos
  has_many :tipo_accs, :through => :estado_accions
   
end
