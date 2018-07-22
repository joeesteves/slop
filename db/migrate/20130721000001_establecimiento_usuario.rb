class EstablecimientoUsuario < ActiveRecord::Migration
  def change
  	 create_table :establecimientos_users do |t|
      t.belongs_to :establecimiento
      t.belongs_to :user
    end
  end
end
