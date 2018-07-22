class Movorigen < ActiveRecord::Base
  belongs_to :movimiento
  attr_accessible :cat_ori, :est_ori, :rod_ori
end
