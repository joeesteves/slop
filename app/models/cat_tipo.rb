class CatTipo < ActiveRecord::Base
  attr_accessible :desc, :nombre, :tipo_accs, :tipo_accs_attributes, :tipo_acc_ids, :estado_ids
  has_one :category
  has_and_belongs_to_many :tipo_accs
  has_and_belongs_to_many :estados


  accepts_nested_attributes_for :tipo_accs
end
