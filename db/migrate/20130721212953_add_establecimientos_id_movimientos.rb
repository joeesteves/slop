class AddEstablecimientosIdMovimientos < ActiveRecord::Migration
	def change
			add_column :movimientos, :establecimiento_id, :integer
			add_index :movimientos, :establecimiento_id 
	end

end
