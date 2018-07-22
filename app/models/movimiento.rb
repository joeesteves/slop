class Movimiento < ActiveRecord::Base
  attr_accessible :desc, :fecha, :rodeo_id, :estado_id, :category_id, :animal_ids, :cantidad, :kilos, :tipo_acc_id, :id
  has_and_belongs_to_many :animals
  belongs_to :estado
  belongs_to :rodeo
  belongs_to :category
  belongs_to :user
  belongs_to :tipo_acc
  validates :rodeo_id, :presence => true
  validates :category_id, :presence => true
  validates :estado_id, :presence => true
  validates :tipo_acc_id, :presence => true
  validates :cantidad, :presence => true
#  validates :kilos, :presence => true

  has_one :movorigen, :dependent => :destroy
  accepts_nested_attributes_for :movorigen

	def self.sesionActual(establecimiento,empresa)
    where('
       establecimiento_id = :establecimiento and empresa_id in (:empresa)', :establecimiento => establecimiento, :empresa => empresa).order('fecha DESC, id desc')
	end
end
