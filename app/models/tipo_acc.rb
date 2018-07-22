class TipoAcc < ActiveRecord::Base
  attr_accessible :codigo, :nombre, :id, :estado_ids, :estado_accions	
  has_and_belongs_to_many :cat_tipos
  #has_and_belongs_to_many :estados
  has_many :estados, :through => :estado_accions
	has_many :estado_accions
  accepts_nested_attributes_for :estado_accions
  validates :codigo, :presence => true


end
